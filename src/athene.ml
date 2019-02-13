include Athene_types

open Hdf5_caml

let save_hdf5 kvpairs filename =
  let h5file = H5.create_trunc filename in
  Array.iter (fun x ->
    let k, v = x in
    H5.write_float_genarray ~deflate:0 h5file k v
  ) kvpairs;
  H5.close h5file


let serialise_tfvariable variable =
  let encoder = Pbrt.Encoder.create () in
  Variable_pb.encode_variable_def variable encoder;
  Pbrt.Encoder.to_bytes encoder
