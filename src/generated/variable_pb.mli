(** variable.proto Binary Encoding *)


(** {2 Protobuf Encoding} *)

val encode_variable_def_save_slice_info_def : Variable_types.variable_def_save_slice_info_def -> Pbrt.Encoder.t -> unit
(** [encode_variable_def_save_slice_info_def v encoder] encodes [v] with the given [encoder] *)

val encode_variable_def : Variable_types.variable_def -> Pbrt.Encoder.t -> unit
(** [encode_variable_def v encoder] encodes [v] with the given [encoder] *)


(** {2 Protobuf Decoding} *)

val decode_variable_def_save_slice_info_def : Pbrt.Decoder.t -> Variable_types.variable_def_save_slice_info_def
(** [decode_variable_def_save_slice_info_def decoder] decodes a [variable_def_save_slice_info_def] value from [decoder] *)

val decode_variable_def : Pbrt.Decoder.t -> Variable_types.variable_def
(** [decode_variable_def decoder] decodes a [variable_def] value from [decoder] *)
