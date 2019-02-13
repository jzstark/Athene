(* variables values to a hdf5 file. *)

open Athene_types

val save_hdf5 : (string * ndarray) array -> string -> unit

val serialise_tfvariable : variable_def -> bytes
