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

signal new_day()

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
    return round((theta*productivity + (1 - theta)*bio_yield) * 1000)


# Update state function
#func update_state(t: float, state_dict: Dictionary, input_dict: Dictionary):
    #var phi_s_e = phi(state_dict['s']) * state_dict['e']
    #var rho_v = rho(state_dict['v'])
    #var mu_q = mu(state_dict['q'])
    #var dt = (t - state_dict['t'])/24
    #var d = input_dict['d']
#
    #state_dict['t'] = t
    #state_dict['s'] += dt * (-phi_s_e / gamma + d * (input_dict['s_in'] - state_dict['s']))
    #state_dict['e'] += dt * ((1 - input_dict['alpha']) * (phi_s_e - m_e * state_dict['e']) - d * state_dict['e'])
    #state_dict['v'] += dt * (input_dict['alpha'] * beta * phi_s_e - rho_v * state_dict['c'] - d * state_dict['v'])
    #state_dict['c'] += dt * (mu_q - m_c - d) * state_dict['c']
    #state_dict['q'] += dt * (rho_v - mu_q * state_dict['q'])
    #state = state_dict

# Update state function
func update_state(t: float, state_dict: Dictionary, input_dict: Dictionary):
    emit_signal("new_day")
    var d = input_dict["d"]
    var hours = t - state_dict["t"]
    state_dict["t"] = t
    var dt = 1 / 24;
    for hr in hours:
        var phi_s_e = phi(state_dict["s"]) * state_dict["e"]
        var rho_v = rho(state_dict["v"])
        var mu_q = mu(state_dict["q"])
        state_dict["s"] += dt * (-phi_s_e / gamma + d * (input_dict["s_in"] - state_dict["s"]))
        state_dict["e"] += dt * ((1 - input_dict["alpha"]) * (phi_s_e - m_e * state_dict["e"]) - d * state_dict["e"])
        state_dict["v"] += dt * (input_dict["alpha"] * beta * phi_s_e - rho_v * state_dict["c"] - d * state_dict["v"])
        state_dict["c"] += dt * (mu_q - m_c - d) * state_dict["c"]
        state_dict["q"] += dt * (rho_v - mu_q * state_dict["q"])
        state = state_dict
