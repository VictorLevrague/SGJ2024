extends Node
# Biological parameters
const phi_max = 6.48
const ks = 0.09
const rho_max = 0.0273
const kv = 0.57e-3
const mu_max = 1.0211
const qmin = 2.7628e-3
const m_e = 0
const m_c = 0
const beta = 0.023
const gamma = 0.63
const theta = 0.8

# Growth/Uptake functions
func phi(s: float) -> float: return phi_max * s / (ks + s)
func rho(v: float) -> float: return rho_max * v / (kv + v)
func mu(q: float) -> float: return mu_max * (1 - qmin / q)

# Define state dictionary
@export var state = {
    "t"= 0.0,# hours
    "s"= 0.1629,
    "e"= 0.0487,
    "v"= 0.003,
    "c"= 0.0177,
    "q"= 0.035
}

# Define input dictionary
@export var input = {
    "d"= 0.5,
    "alpha"= 0.5,
    "s_in"= 0.5
}

"""
Use for print for GUI
"""
func get_bacteria() -> float: return (round(state['e']* 1000));
"""
Use for print for GUI
"""
func get_algae() -> float: return (round(state['c']* 1000));
"""
Use for print for GUI
"""
func get_score() -> float:
    var c = state['c'];
    var productivity = input['d'] * c
    var bio_yield = c / input['s_in']
    var score = theta*productivity + (1 - theta)*bio_yield
    return round(score * 1000)

"""
Update dynamical system's state for new input at new time.
"""
func update_state(t: float, state: Dictionary, input: Dictionary):
    var phi_s_e = 0
    var rho_v = 0
    var mu_q = 0
    var d = input["d"]
    var hours = t - state["t"]
    state["t"] = t
    var dt = 1.0 / 24.0;
    for h in range(int(hours)):
        phi_s_e = phi(state["s"]) * state["e"]
        rho_v = rho(state["v"])
        mu_q = mu(state["q"])
        state["s"] += dt * (-phi_s_e / gamma + d * (input["s_in"] - state["s"]))
        state["e"] += dt * ((1.0 - input["alpha"]) * (phi_s_e - m_e * state["e"]) - d * state["e"])
        state["v"] += dt * (input["alpha"] * beta * phi_s_e - rho_v * state["c"] - d * state["v"])
        state["q"] += dt * (rho_v - mu_q * state["q"])
        state["c"] += dt * (mu_q - m_c - d) * state["c"]
