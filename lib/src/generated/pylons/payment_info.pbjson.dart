///
//  Generated code. Do not modify.
//  source: pylons/payment_info.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use paymentInfoDescriptor instead')
const PaymentInfo$json = const {
  '1': 'PaymentInfo',
  '2': const [
    const {'1': 'purchaseID', '3': 1, '4': 1, '5': 9, '10': 'purchaseID'},
    const {'1': 'processorName', '3': 2, '4': 1, '5': 9, '10': 'processorName'},
    const {'1': 'payerAddr', '3': 3, '4': 1, '5': 9, '10': 'payerAddr'},
    const {'1': 'amount', '3': 4, '4': 1, '5': 9, '8': const {}, '10': 'amount'},
    const {'1': 'productID', '3': 5, '4': 1, '5': 9, '10': 'productID'},
    const {'1': 'signature', '3': 6, '4': 1, '5': 9, '10': 'signature'},
  ],
};

/// Descriptor for `PaymentInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paymentInfoDescriptor = $convert.base64Decode('CgtQYXltZW50SW5mbxIeCgpwdXJjaGFzZUlEGAEgASgJUgpwdXJjaGFzZUlEEiQKDXByb2Nlc3Nvck5hbWUYAiABKAlSDXByb2Nlc3Nvck5hbWUSHAoJcGF5ZXJBZGRyGAMgASgJUglwYXllckFkZHISRgoGYW1vdW50GAQgASgJQi7I3h8A2t4fJmdpdGh1Yi5jb20vY29zbW9zL2Nvc21vcy1zZGsvdHlwZXMuSW50UgZhbW91bnQSHAoJcHJvZHVjdElEGAUgASgJUglwcm9kdWN0SUQSHAoJc2lnbmF0dXJlGAYgASgJUglzaWduYXR1cmU=');
