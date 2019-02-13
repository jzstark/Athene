[@@@ocaml.warning "-27-30-39"]

type variable_def_save_slice_info_def_mutable = {
  mutable full_name : string;
  mutable full_shape : int64;
  mutable var_offset : int64;
  mutable var_shape : int64;
}

let default_variable_def_save_slice_info_def_mutable () : variable_def_save_slice_info_def_mutable = {
  full_name = "";
  full_shape = 0L;
  var_offset = 0L;
  var_shape = 0L;
}

type variable_def_mutable = {
  mutable variable_name : string;
  mutable initial_value_name : string;
  mutable initializer_name : string;
  mutable snapshot_name : string;
  mutable save_slice_info_def : Variable_types.variable_def_save_slice_info_def option;
  mutable is_resource : bool;
  mutable trainable : bool;
}

let default_variable_def_mutable () : variable_def_mutable = {
  variable_name = "";
  initial_value_name = "";
  initializer_name = "";
  snapshot_name = "";
  save_slice_info_def = None;
  is_resource = false;
  trainable = false;
}


let rec decode_variable_def_save_slice_info_def d =
  let v = default_variable_def_save_slice_info_def_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.full_name <- Pbrt.Decoder.string d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(variable_def_save_slice_info_def), field(1)" pk
    | Some (2, Pbrt.Varint) -> begin
      v.full_shape <- Pbrt.Decoder.int64_as_varint d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(variable_def_save_slice_info_def), field(2)" pk
    | Some (3, Pbrt.Varint) -> begin
      v.var_offset <- Pbrt.Decoder.int64_as_varint d;
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(variable_def_save_slice_info_def), field(3)" pk
    | Some (4, Pbrt.Varint) -> begin
      v.var_shape <- Pbrt.Decoder.int64_as_varint d;
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(variable_def_save_slice_info_def), field(4)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Variable_types.full_name = v.full_name;
    Variable_types.full_shape = v.full_shape;
    Variable_types.var_offset = v.var_offset;
    Variable_types.var_shape = v.var_shape;
  } : Variable_types.variable_def_save_slice_info_def)

let rec decode_variable_def d =
  let v = default_variable_def_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.variable_name <- Pbrt.Decoder.string d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(variable_def), field(1)" pk
    | Some (6, Pbrt.Bytes) -> begin
      v.initial_value_name <- Pbrt.Decoder.string d;
    end
    | Some (6, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(variable_def), field(6)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.initializer_name <- Pbrt.Decoder.string d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(variable_def), field(2)" pk
    | Some (3, Pbrt.Bytes) -> begin
      v.snapshot_name <- Pbrt.Decoder.string d;
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(variable_def), field(3)" pk
    | Some (4, Pbrt.Bytes) -> begin
      v.save_slice_info_def <- Some (decode_variable_def_save_slice_info_def (Pbrt.Decoder.nested d));
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(variable_def), field(4)" pk
    | Some (5, Pbrt.Varint) -> begin
      v.is_resource <- Pbrt.Decoder.bool d;
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(variable_def), field(5)" pk
    | Some (7, Pbrt.Varint) -> begin
      v.trainable <- Pbrt.Decoder.bool d;
    end
    | Some (7, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(variable_def), field(7)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Variable_types.variable_name = v.variable_name;
    Variable_types.initial_value_name = v.initial_value_name;
    Variable_types.initializer_name = v.initializer_name;
    Variable_types.snapshot_name = v.snapshot_name;
    Variable_types.save_slice_info_def = v.save_slice_info_def;
    Variable_types.is_resource = v.is_resource;
    Variable_types.trainable = v.trainable;
  } : Variable_types.variable_def)

let rec encode_variable_def_save_slice_info_def (v:Variable_types.variable_def_save_slice_info_def) encoder = 
  Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Variable_types.full_name encoder;
  Pbrt.Encoder.key (2, Pbrt.Varint) encoder; 
  Pbrt.Encoder.int64_as_varint v.Variable_types.full_shape encoder;
  Pbrt.Encoder.key (3, Pbrt.Varint) encoder; 
  Pbrt.Encoder.int64_as_varint v.Variable_types.var_offset encoder;
  Pbrt.Encoder.key (4, Pbrt.Varint) encoder; 
  Pbrt.Encoder.int64_as_varint v.Variable_types.var_shape encoder;
  ()

let rec encode_variable_def (v:Variable_types.variable_def) encoder = 
  Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Variable_types.variable_name encoder;
  Pbrt.Encoder.key (6, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Variable_types.initial_value_name encoder;
  Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Variable_types.initializer_name encoder;
  Pbrt.Encoder.key (3, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Variable_types.snapshot_name encoder;
  begin match v.Variable_types.save_slice_info_def with
  | Some x -> 
    Pbrt.Encoder.key (4, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_variable_def_save_slice_info_def x) encoder;
  | None -> ();
  end;
  Pbrt.Encoder.key (5, Pbrt.Varint) encoder; 
  Pbrt.Encoder.bool v.Variable_types.is_resource encoder;
  Pbrt.Encoder.key (7, Pbrt.Varint) encoder; 
  Pbrt.Encoder.bool v.Variable_types.trainable encoder;
  ()
