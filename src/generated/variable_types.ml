[@@@ocaml.warning "-27-30-39"]


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

let rec default_variable_def_save_slice_info_def 
  ?full_name:((full_name:string) = "")
  ?full_shape:((full_shape:int64) = 0L)
  ?var_offset:((var_offset:int64) = 0L)
  ?var_shape:((var_shape:int64) = 0L)
  () : variable_def_save_slice_info_def  = {
  full_name;
  full_shape;
  var_offset;
  var_shape;
}

let rec default_variable_def 
  ?variable_name:((variable_name:string) = "")
  ?initial_value_name:((initial_value_name:string) = "")
  ?initializer_name:((initializer_name:string) = "")
  ?snapshot_name:((snapshot_name:string) = "")
  ?save_slice_info_def:((save_slice_info_def:variable_def_save_slice_info_def option) = None)
  ?is_resource:((is_resource:bool) = false)
  ?trainable:((trainable:bool) = false)
  () : variable_def  = {
  variable_name;
  initial_value_name;
  initializer_name;
  snapshot_name;
  save_slice_info_def;
  is_resource;
  trainable;
}
