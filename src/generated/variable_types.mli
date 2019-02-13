(** variable.proto Types *)



(** {2 Types} *)

type variable_def_save_slice_info_def = {
  full_name : string;
  full_shape : int64;
  var_offset : int64;
  var_shape : int64;
}

type variable_def = {
  variable_name : string;
  initial_value_name : string;
  initializer_name : string;
  snapshot_name : string;
  save_slice_info_def : variable_def_save_slice_info_def option;
  is_resource : bool;
  trainable : bool;
}


(** {2 Default values} *)

val default_variable_def_save_slice_info_def :
  ?full_name:string ->
  ?full_shape:int64 ->
  ?var_offset:int64 ->
  ?var_shape:int64 ->
  unit ->
  variable_def_save_slice_info_def
(** [default_variable_def_save_slice_info_def ()] is the default value for type [variable_def_save_slice_info_def] *)

val default_variable_def :
  ?variable_name:string ->
  ?initial_value_name:string ->
  ?initializer_name:string ->
  ?snapshot_name:string ->
  ?save_slice_info_def:variable_def_save_slice_info_def option ->
  ?is_resource:bool ->
  ?trainable:bool ->
  unit ->
  variable_def
(** [default_variable_def ()] is the default value for type [variable_def] *)
