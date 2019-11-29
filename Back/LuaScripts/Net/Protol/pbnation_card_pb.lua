--Generated By protoc-gen-lua Do not Edit
local protobuf = require "Framework.Net.Protobuf.protobuf"
local pbcommon_pb = require("Net.Protol.pbcommon_pb")
local _M = {}

_M.GET_NATION_CARDS_RESPONSE = protobuf.Descriptor();
_M.GET_NATION_CARDS_RESPONSE_NATION_CARD_FIELD = protobuf.FieldDescriptor();
_M.CONSCRIPTION_REQUEST = protobuf.Descriptor();
_M.CONSCRIPTION_REQUEST_TYPE_FIELD = protobuf.FieldDescriptor();
_M.CONSCRIPTION_REQUEST_TEAMID_FIELD = protobuf.FieldDescriptor();
_M.CONSCRIPTION_REQUEST_TOWNID_FIELD = protobuf.FieldDescriptor();
_M.CONSCRIPTION_REQUEST_CONSCRIPTION_FIELD = protobuf.FieldDescriptor();
_M.CONSCRIPTION_REQUEST_GUIDE_FIELD = protobuf.FieldDescriptor();
_M.CONSCRIPTION_RESPONSE = protobuf.Descriptor();
_M.CONSCRIPTION_RESPONSE_NATION_CARD_FIELD = protobuf.FieldDescriptor();
_M.SYNC_NATION_ONE_CARD_REQUEST = protobuf.Descriptor();
_M.SYNC_NATION_ONE_CARD_REQUEST_CARDID_FIELD = protobuf.FieldDescriptor();
_M.SYNC_NATION_ONE_CARD_RESPONSE = protobuf.Descriptor();
_M.SYNC_NATION_ONE_CARD_RESPONSE_ONECARD_FIELD = protobuf.FieldDescriptor();
_M.STOP_CONSCRIPTION_REQUEST = protobuf.Descriptor();
_M.STOP_CONSCRIPTION_REQUEST_TEAMID_FIELD = protobuf.FieldDescriptor();
_M.STOP_CONSCRIPTION_RESPONSE = protobuf.Descriptor();
_M.STOP_CONSCRIPTION_RESPONSE_CONSCRIPTION_FIELD = protobuf.FieldDescriptor();
_M.CONSCRIPTION = protobuf.Descriptor();
_M.CONSCRIPTION_CARDID_FIELD = protobuf.FieldDescriptor();
_M.CONSCRIPTION_COUNT_FIELD = protobuf.FieldDescriptor();

_M.GET_NATION_CARDS_RESPONSE_NATION_CARD_FIELD.name = "nation_card"
_M.GET_NATION_CARDS_RESPONSE_NATION_CARD_FIELD.full_name = ".get_nation_cards_response.nation_card"
_M.GET_NATION_CARDS_RESPONSE_NATION_CARD_FIELD.number = 1
_M.GET_NATION_CARDS_RESPONSE_NATION_CARD_FIELD.index = 0
_M.GET_NATION_CARDS_RESPONSE_NATION_CARD_FIELD.label = 3
_M.GET_NATION_CARDS_RESPONSE_NATION_CARD_FIELD.has_default_value = false
_M.GET_NATION_CARDS_RESPONSE_NATION_CARD_FIELD.default_value = {}
_M.GET_NATION_CARDS_RESPONSE_NATION_CARD_FIELD.message_type = pbcommon_pb.NATIONCARD
_M.GET_NATION_CARDS_RESPONSE_NATION_CARD_FIELD.type = 11
_M.GET_NATION_CARDS_RESPONSE_NATION_CARD_FIELD.cpp_type = 10

_M.GET_NATION_CARDS_RESPONSE.name = "get_nation_cards_response"
_M.GET_NATION_CARDS_RESPONSE.full_name = ".get_nation_cards_response"
_M.GET_NATION_CARDS_RESPONSE.nested_types = {}
_M.GET_NATION_CARDS_RESPONSE.enum_types = {}
_M.GET_NATION_CARDS_RESPONSE.fields = {_M.GET_NATION_CARDS_RESPONSE_NATION_CARD_FIELD}
_M.GET_NATION_CARDS_RESPONSE.is_extendable = false
_M.GET_NATION_CARDS_RESPONSE.extensions = {}
_M.CONSCRIPTION_REQUEST_TYPE_FIELD.name = "type"
_M.CONSCRIPTION_REQUEST_TYPE_FIELD.full_name = ".conscription_request.type"
_M.CONSCRIPTION_REQUEST_TYPE_FIELD.number = 1
_M.CONSCRIPTION_REQUEST_TYPE_FIELD.index = 0
_M.CONSCRIPTION_REQUEST_TYPE_FIELD.label = 1
_M.CONSCRIPTION_REQUEST_TYPE_FIELD.has_default_value = false
_M.CONSCRIPTION_REQUEST_TYPE_FIELD.default_value = 0
_M.CONSCRIPTION_REQUEST_TYPE_FIELD.type = 5
_M.CONSCRIPTION_REQUEST_TYPE_FIELD.cpp_type = 1

_M.CONSCRIPTION_REQUEST_TEAMID_FIELD.name = "teamId"
_M.CONSCRIPTION_REQUEST_TEAMID_FIELD.full_name = ".conscription_request.teamId"
_M.CONSCRIPTION_REQUEST_TEAMID_FIELD.number = 2
_M.CONSCRIPTION_REQUEST_TEAMID_FIELD.index = 1
_M.CONSCRIPTION_REQUEST_TEAMID_FIELD.label = 1
_M.CONSCRIPTION_REQUEST_TEAMID_FIELD.has_default_value = false
_M.CONSCRIPTION_REQUEST_TEAMID_FIELD.default_value = 0
_M.CONSCRIPTION_REQUEST_TEAMID_FIELD.type = 5
_M.CONSCRIPTION_REQUEST_TEAMID_FIELD.cpp_type = 1

_M.CONSCRIPTION_REQUEST_TOWNID_FIELD.name = "townId"
_M.CONSCRIPTION_REQUEST_TOWNID_FIELD.full_name = ".conscription_request.townId"
_M.CONSCRIPTION_REQUEST_TOWNID_FIELD.number = 3
_M.CONSCRIPTION_REQUEST_TOWNID_FIELD.index = 2
_M.CONSCRIPTION_REQUEST_TOWNID_FIELD.label = 1
_M.CONSCRIPTION_REQUEST_TOWNID_FIELD.has_default_value = false
_M.CONSCRIPTION_REQUEST_TOWNID_FIELD.default_value = 0
_M.CONSCRIPTION_REQUEST_TOWNID_FIELD.type = 5
_M.CONSCRIPTION_REQUEST_TOWNID_FIELD.cpp_type = 1

_M.CONSCRIPTION_REQUEST_CONSCRIPTION_FIELD.name = "conscription"
_M.CONSCRIPTION_REQUEST_CONSCRIPTION_FIELD.full_name = ".conscription_request.conscription"
_M.CONSCRIPTION_REQUEST_CONSCRIPTION_FIELD.number = 4
_M.CONSCRIPTION_REQUEST_CONSCRIPTION_FIELD.index = 3
_M.CONSCRIPTION_REQUEST_CONSCRIPTION_FIELD.label = 3
_M.CONSCRIPTION_REQUEST_CONSCRIPTION_FIELD.has_default_value = false
_M.CONSCRIPTION_REQUEST_CONSCRIPTION_FIELD.default_value = {}
_M.CONSCRIPTION_REQUEST_CONSCRIPTION_FIELD.message_type = _M.CONSCRIPTION
_M.CONSCRIPTION_REQUEST_CONSCRIPTION_FIELD.type = 11
_M.CONSCRIPTION_REQUEST_CONSCRIPTION_FIELD.cpp_type = 10

_M.CONSCRIPTION_REQUEST_GUIDE_FIELD.name = "guide"
_M.CONSCRIPTION_REQUEST_GUIDE_FIELD.full_name = ".conscription_request.guide"
_M.CONSCRIPTION_REQUEST_GUIDE_FIELD.number = 5
_M.CONSCRIPTION_REQUEST_GUIDE_FIELD.index = 4
_M.CONSCRIPTION_REQUEST_GUIDE_FIELD.label = 1
_M.CONSCRIPTION_REQUEST_GUIDE_FIELD.has_default_value = false
_M.CONSCRIPTION_REQUEST_GUIDE_FIELD.default_value = 0
_M.CONSCRIPTION_REQUEST_GUIDE_FIELD.type = 5
_M.CONSCRIPTION_REQUEST_GUIDE_FIELD.cpp_type = 1

_M.CONSCRIPTION_REQUEST.name = "conscription_request"
_M.CONSCRIPTION_REQUEST.full_name = ".conscription_request"
_M.CONSCRIPTION_REQUEST.nested_types = {}
_M.CONSCRIPTION_REQUEST.enum_types = {}
_M.CONSCRIPTION_REQUEST.fields = {_M.CONSCRIPTION_REQUEST_TYPE_FIELD, _M.CONSCRIPTION_REQUEST_TEAMID_FIELD, _M.CONSCRIPTION_REQUEST_TOWNID_FIELD, _M.CONSCRIPTION_REQUEST_CONSCRIPTION_FIELD, _M.CONSCRIPTION_REQUEST_GUIDE_FIELD}
_M.CONSCRIPTION_REQUEST.is_extendable = false
_M.CONSCRIPTION_REQUEST.extensions = {}
_M.CONSCRIPTION_RESPONSE_NATION_CARD_FIELD.name = "nation_card"
_M.CONSCRIPTION_RESPONSE_NATION_CARD_FIELD.full_name = ".conscription_response.nation_card"
_M.CONSCRIPTION_RESPONSE_NATION_CARD_FIELD.number = 1
_M.CONSCRIPTION_RESPONSE_NATION_CARD_FIELD.index = 0
_M.CONSCRIPTION_RESPONSE_NATION_CARD_FIELD.label = 3
_M.CONSCRIPTION_RESPONSE_NATION_CARD_FIELD.has_default_value = false
_M.CONSCRIPTION_RESPONSE_NATION_CARD_FIELD.default_value = {}
_M.CONSCRIPTION_RESPONSE_NATION_CARD_FIELD.message_type = pbcommon_pb.NATIONCARD
_M.CONSCRIPTION_RESPONSE_NATION_CARD_FIELD.type = 11
_M.CONSCRIPTION_RESPONSE_NATION_CARD_FIELD.cpp_type = 10

_M.CONSCRIPTION_RESPONSE.name = "conscription_response"
_M.CONSCRIPTION_RESPONSE.full_name = ".conscription_response"
_M.CONSCRIPTION_RESPONSE.nested_types = {}
_M.CONSCRIPTION_RESPONSE.enum_types = {}
_M.CONSCRIPTION_RESPONSE.fields = {_M.CONSCRIPTION_RESPONSE_NATION_CARD_FIELD}
_M.CONSCRIPTION_RESPONSE.is_extendable = false
_M.CONSCRIPTION_RESPONSE.extensions = {}
_M.SYNC_NATION_ONE_CARD_REQUEST_CARDID_FIELD.name = "cardId"
_M.SYNC_NATION_ONE_CARD_REQUEST_CARDID_FIELD.full_name = ".sync_nation_one_card_request.cardId"
_M.SYNC_NATION_ONE_CARD_REQUEST_CARDID_FIELD.number = 1
_M.SYNC_NATION_ONE_CARD_REQUEST_CARDID_FIELD.index = 0
_M.SYNC_NATION_ONE_CARD_REQUEST_CARDID_FIELD.label = 1
_M.SYNC_NATION_ONE_CARD_REQUEST_CARDID_FIELD.has_default_value = false
_M.SYNC_NATION_ONE_CARD_REQUEST_CARDID_FIELD.default_value = 0
_M.SYNC_NATION_ONE_CARD_REQUEST_CARDID_FIELD.type = 5
_M.SYNC_NATION_ONE_CARD_REQUEST_CARDID_FIELD.cpp_type = 1

_M.SYNC_NATION_ONE_CARD_REQUEST.name = "sync_nation_one_card_request"
_M.SYNC_NATION_ONE_CARD_REQUEST.full_name = ".sync_nation_one_card_request"
_M.SYNC_NATION_ONE_CARD_REQUEST.nested_types = {}
_M.SYNC_NATION_ONE_CARD_REQUEST.enum_types = {}
_M.SYNC_NATION_ONE_CARD_REQUEST.fields = {_M.SYNC_NATION_ONE_CARD_REQUEST_CARDID_FIELD}
_M.SYNC_NATION_ONE_CARD_REQUEST.is_extendable = false
_M.SYNC_NATION_ONE_CARD_REQUEST.extensions = {}
_M.SYNC_NATION_ONE_CARD_RESPONSE_ONECARD_FIELD.name = "oneCard"
_M.SYNC_NATION_ONE_CARD_RESPONSE_ONECARD_FIELD.full_name = ".sync_nation_one_card_response.oneCard"
_M.SYNC_NATION_ONE_CARD_RESPONSE_ONECARD_FIELD.number = 1
_M.SYNC_NATION_ONE_CARD_RESPONSE_ONECARD_FIELD.index = 0
_M.SYNC_NATION_ONE_CARD_RESPONSE_ONECARD_FIELD.label = 1
_M.SYNC_NATION_ONE_CARD_RESPONSE_ONECARD_FIELD.has_default_value = false
_M.SYNC_NATION_ONE_CARD_RESPONSE_ONECARD_FIELD.default_value = nil
_M.SYNC_NATION_ONE_CARD_RESPONSE_ONECARD_FIELD.message_type = pbcommon_pb.NATIONCARD
_M.SYNC_NATION_ONE_CARD_RESPONSE_ONECARD_FIELD.type = 11
_M.SYNC_NATION_ONE_CARD_RESPONSE_ONECARD_FIELD.cpp_type = 10

_M.SYNC_NATION_ONE_CARD_RESPONSE.name = "sync_nation_one_card_response"
_M.SYNC_NATION_ONE_CARD_RESPONSE.full_name = ".sync_nation_one_card_response"
_M.SYNC_NATION_ONE_CARD_RESPONSE.nested_types = {}
_M.SYNC_NATION_ONE_CARD_RESPONSE.enum_types = {}
_M.SYNC_NATION_ONE_CARD_RESPONSE.fields = {_M.SYNC_NATION_ONE_CARD_RESPONSE_ONECARD_FIELD}
_M.SYNC_NATION_ONE_CARD_RESPONSE.is_extendable = false
_M.SYNC_NATION_ONE_CARD_RESPONSE.extensions = {}
_M.STOP_CONSCRIPTION_REQUEST_TEAMID_FIELD.name = "teamId"
_M.STOP_CONSCRIPTION_REQUEST_TEAMID_FIELD.full_name = ".stop_conscription_request.teamId"
_M.STOP_CONSCRIPTION_REQUEST_TEAMID_FIELD.number = 1
_M.STOP_CONSCRIPTION_REQUEST_TEAMID_FIELD.index = 0
_M.STOP_CONSCRIPTION_REQUEST_TEAMID_FIELD.label = 1
_M.STOP_CONSCRIPTION_REQUEST_TEAMID_FIELD.has_default_value = false
_M.STOP_CONSCRIPTION_REQUEST_TEAMID_FIELD.default_value = 0
_M.STOP_CONSCRIPTION_REQUEST_TEAMID_FIELD.type = 5
_M.STOP_CONSCRIPTION_REQUEST_TEAMID_FIELD.cpp_type = 1

_M.STOP_CONSCRIPTION_REQUEST.name = "stop_conscription_request"
_M.STOP_CONSCRIPTION_REQUEST.full_name = ".stop_conscription_request"
_M.STOP_CONSCRIPTION_REQUEST.nested_types = {}
_M.STOP_CONSCRIPTION_REQUEST.enum_types = {}
_M.STOP_CONSCRIPTION_REQUEST.fields = {_M.STOP_CONSCRIPTION_REQUEST_TEAMID_FIELD}
_M.STOP_CONSCRIPTION_REQUEST.is_extendable = false
_M.STOP_CONSCRIPTION_REQUEST.extensions = {}
_M.STOP_CONSCRIPTION_RESPONSE_CONSCRIPTION_FIELD.name = "conscription"
_M.STOP_CONSCRIPTION_RESPONSE_CONSCRIPTION_FIELD.full_name = ".stop_conscription_response.conscription"
_M.STOP_CONSCRIPTION_RESPONSE_CONSCRIPTION_FIELD.number = 1
_M.STOP_CONSCRIPTION_RESPONSE_CONSCRIPTION_FIELD.index = 0
_M.STOP_CONSCRIPTION_RESPONSE_CONSCRIPTION_FIELD.label = 3
_M.STOP_CONSCRIPTION_RESPONSE_CONSCRIPTION_FIELD.has_default_value = false
_M.STOP_CONSCRIPTION_RESPONSE_CONSCRIPTION_FIELD.default_value = {}
_M.STOP_CONSCRIPTION_RESPONSE_CONSCRIPTION_FIELD.message_type = _M.CONSCRIPTION
_M.STOP_CONSCRIPTION_RESPONSE_CONSCRIPTION_FIELD.type = 11
_M.STOP_CONSCRIPTION_RESPONSE_CONSCRIPTION_FIELD.cpp_type = 10

_M.STOP_CONSCRIPTION_RESPONSE.name = "stop_conscription_response"
_M.STOP_CONSCRIPTION_RESPONSE.full_name = ".stop_conscription_response"
_M.STOP_CONSCRIPTION_RESPONSE.nested_types = {}
_M.STOP_CONSCRIPTION_RESPONSE.enum_types = {}
_M.STOP_CONSCRIPTION_RESPONSE.fields = {_M.STOP_CONSCRIPTION_RESPONSE_CONSCRIPTION_FIELD}
_M.STOP_CONSCRIPTION_RESPONSE.is_extendable = false
_M.STOP_CONSCRIPTION_RESPONSE.extensions = {}
_M.CONSCRIPTION_CARDID_FIELD.name = "cardId"
_M.CONSCRIPTION_CARDID_FIELD.full_name = ".Conscription.cardId"
_M.CONSCRIPTION_CARDID_FIELD.number = 1
_M.CONSCRIPTION_CARDID_FIELD.index = 0
_M.CONSCRIPTION_CARDID_FIELD.label = 1
_M.CONSCRIPTION_CARDID_FIELD.has_default_value = false
_M.CONSCRIPTION_CARDID_FIELD.default_value = 0
_M.CONSCRIPTION_CARDID_FIELD.type = 5
_M.CONSCRIPTION_CARDID_FIELD.cpp_type = 1

_M.CONSCRIPTION_COUNT_FIELD.name = "count"
_M.CONSCRIPTION_COUNT_FIELD.full_name = ".Conscription.count"
_M.CONSCRIPTION_COUNT_FIELD.number = 2
_M.CONSCRIPTION_COUNT_FIELD.index = 1
_M.CONSCRIPTION_COUNT_FIELD.label = 1
_M.CONSCRIPTION_COUNT_FIELD.has_default_value = false
_M.CONSCRIPTION_COUNT_FIELD.default_value = 0
_M.CONSCRIPTION_COUNT_FIELD.type = 5
_M.CONSCRIPTION_COUNT_FIELD.cpp_type = 1

_M.CONSCRIPTION.name = "Conscription"
_M.CONSCRIPTION.full_name = ".Conscription"
_M.CONSCRIPTION.nested_types = {}
_M.CONSCRIPTION.enum_types = {}
_M.CONSCRIPTION.fields = {_M.CONSCRIPTION_CARDID_FIELD, _M.CONSCRIPTION_COUNT_FIELD}
_M.CONSCRIPTION.is_extendable = false
_M.CONSCRIPTION.extensions = {}

_M.Conscription = protobuf.Message(_M.CONSCRIPTION)
_M.conscription_request = protobuf.Message(_M.CONSCRIPTION_REQUEST)
_M.conscription_response = protobuf.Message(_M.CONSCRIPTION_RESPONSE)
_M.get_nation_cards_response = protobuf.Message(_M.GET_NATION_CARDS_RESPONSE)
_M.stop_conscription_request = protobuf.Message(_M.STOP_CONSCRIPTION_REQUEST)
_M.stop_conscription_response = protobuf.Message(_M.STOP_CONSCRIPTION_RESPONSE)
_M.sync_nation_one_card_request = protobuf.Message(_M.SYNC_NATION_ONE_CARD_REQUEST)
_M.sync_nation_one_card_response = protobuf.Message(_M.SYNC_NATION_ONE_CARD_RESPONSE)

return _M