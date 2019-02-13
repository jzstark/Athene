(* TODO: One biggest problem is the dependency circle! You cannot use this lib in owl-tensorflow source code! *)

open Hdf5_caml

module N = Owl_dense_ndarray.D (* has to be D *)
module G = Owl_computation_cpu_engine.Make (N)

open G.Type

let is_initialiser = function
  | Ones _shape      -> true
  | Zeros _shape     -> true
  | Uniform _shape   -> true
  | Gaussian _shape  -> true
  | Bernoulli _shape -> true
  | _                -> false


let collect_initialisers cgraph =
  let outputs = G.get_outputs cgraph in
  let stack = Owl_utils_stack.make () in
  Owl_graph.iter_ancestors (fun v ->
    let op_typ = G.get_operator v in
    if is_initialiser op_typ then
    Owl_utils_stack.push stack v
  ) outputs;
  Owl_utils_stack.to_array stack


let unpack_arr node = node |> G.node_to_arr |> G.unpack_arr


(* let unpack_elt node = node |> G.node_to_elt |> G.unpack_elt *)


(* NOTE: suppose the graph is already evaluated!!! *)
let save_cgraph_variables (cgraph : G.graph) filename =
  let init_nodes = collect_initialisers cgraph in
  let init_names = Array.map Owl_graph.name init_nodes in
  let h5file = H5.create_trunc filename in
  Array.iteri (fun i n ->
    let v = unpack_arr n in
    H5.write_float_genarray ~deflate:0 h5file init_names.(i) v
  ) init_nodes;
  H5.close h5file
