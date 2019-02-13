module G : Owl_computation_graph_sig.Sig


(* Save computation graph variables values to a hdf5 file.
 * Assume the cgraph is already evaluated.
 *)
val save_cgraph_variables : G.graph -> string -> unit


(* val serialise_tfvariable : tfnode -> bytes *)
