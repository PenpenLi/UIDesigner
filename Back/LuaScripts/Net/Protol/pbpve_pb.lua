--Generated By protoc-gen-lua Do not Edit
local protobuf = require "Framework.Net.Protobuf.protobuf"
local pbcommon_pb = require("Net.Protol.pbcommon_pb")
local _M = {}

_M.GET_REED_TOWER_REQUEST = protobuf.Descriptor();
_M.GET_REED_TOWER_RESPONSE = protobuf.Descriptor();
_M.GET_REED_TOWER_RESPONSE_TEAMMANAGER_FIELD = protobuf.FieldDescriptor();
_M.GET_REED_TOWER_RESPONSE_CAMP_FIELD = protobuf.FieldDescriptor();
_M.CAMP = protobuf.Descriptor();
_M.CAMP_CAMP_FIELD = protobuf.FieldDescriptor();
_M.CAMP_REEDTOWER_FIELD = protobuf.FieldDescriptor();
_M.REEDTOWER = protobuf.Descriptor();
_M.REEDTOWER_ID_FIELD = protobuf.FieldDescriptor();
_M.REEDTOWER_RESULT_FIELD = protobuf.FieldDescriptor();

_M.GET_REED_TOWER_REQUEST.name = "get_reed_tower_request"
_M.GET_REED_TOWER_REQUEST.full_name = ".get_reed_tower_request"
_M.GET_REED_TOWER_REQUEST.nested_types = {}
_M.GET_REED_TOWER_REQUEST.enum_types = {}
_M.GET_REED_TOWER_REQUEST.fields = {}
_M.GET_REED_TOWER_REQUEST.is_extendable = false
_M.GET_REED_TOWER_REQUEST.extensions = {}
_M.GET_REED_TOWER_RESPONSE_TEAMMANAGER_FIELD.name = "teamManager"
_M.GET_REED_TOWER_RESPONSE_TEAMMANAGER_FIELD.full_name = ".get_reed_tower_response.teamManager"
_M.GET_REED_TOWER_RESPONSE_TEAMMANAGER_FIELD.number = 1
_M.GET_REED_TOWER_RESPONSE_TEAMMANAGER_FIELD.index = 0
_M.GET_REED_TOWER_RESPONSE_TEAMMANAGER_FIELD.label = 3
_M.GET_REED_TOWER_RESPONSE_TEAMMANAGER_FIELD.has_default_value = false
_M.GET_REED_TOWER_RESPONSE_TEAMMANAGER_FIELD.default_value = {}
_M.GET_REED_TOWER_RESPONSE_TEAMMANAGER_FIELD.message_type = pbcommon_pb.TEAMMANAGER
_M.GET_REED_TOWER_RESPONSE_TEAMMANAGER_FIELD.type = 11
_M.GET_REED_TOWER_RESPONSE_TEAMMANAGER_FIELD.cpp_type = 10

_M.GET_REED_TOWER_RESPONSE_CAMP_FIELD.name = "camp"
_M.GET_REED_TOWER_RESPONSE_CAMP_FIELD.full_name = ".get_reed_tower_response.camp"
_M.GET_REED_TOWER_RESPONSE_CAMP_FIELD.number = 2
_M.GET_REED_TOWER_RESPONSE_CAMP_FIELD.index = 1
_M.GET_REED_TOWER_RESPONSE_CAMP_FIELD.label = 3
_M.GET_REED_TOWER_RESPONSE_CAMP_FIELD.has_default_value = false
_M.GET_REED_TOWER_RESPONSE_CAMP_FIELD.default_value = {}
_M.GET_REED_TOWER_RESPONSE_CAMP_FIELD.message_type = _M.CAMP
_M.GET_REED_TOWER_RESPONSE_CAMP_FIELD.type = 11
_M.GET_REED_TOWER_RESPONSE_CAMP_FIELD.cpp_type = 10

_M.GET_REED_TOWER_RESPONSE.name = "get_reed_tower_response"
_M.GET_REED_TOWER_RESPONSE.full_name = ".get_reed_tower_response"
_M.GET_REED_TOWER_RESPONSE.nested_types = {}
_M.GET_REED_TOWER_RESPONSE.enum_types = {}
_M.GET_REED_TOWER_RESPONSE.fields = {_M.GET_REED_TOWER_RESPONSE_TEAMMANAGER_FIELD, _M.GET_REED_TOWER_RESPONSE_CAMP_FIELD}
_M.GET_REED_TOWER_RESPONSE.is_extendable = false
_M.GET_REED_TOWER_RESPONSE.extensions = {}
_M.CAMP_CAMP_FIELD.name = "camp"
_M.CAMP_CAMP_FIELD.full_name = ".Camp.camp"
_M.CAMP_CAMP_FIELD.number = 1
_M.CAMP_CAMP_FIELD.index = 0
_M.CAMP_CAMP_FIELD.label = 1
_M.CAMP_CAMP_FIELD.has_default_value = false
_M.CAMP_CAMP_FIELD.default_value = 0
_M.CAMP_CAMP_FIELD.type = 5
_M.CAMP_CAMP_FIELD.cpp_type = 1

_M.CAMP_REEDTOWER_FIELD.name = "ReedTower"
_M.CAMP_REEDTOWER_FIELD.full_name = ".Camp.ReedTower"
_M.CAMP_REEDTOWER_FIELD.number = 2
_M.CAMP_REEDTOWER_FIELD.index = 1
_M.CAMP_REEDTOWER_FIELD.label = 3
_M.CAMP_REEDTOWER_FIELD.has_default_value = false
_M.CAMP_REEDTOWER_FIELD.default_value = {}
_M.CAMP_REEDTOWER_FIELD.message_type = _M.REEDTOWER
_M.CAMP_REEDTOWER_FIELD.type = 11
_M.CAMP_REEDTOWER_FIELD.cpp_type = 10

_M.CAMP.name = "Camp"
_M.CAMP.full_name = ".Camp"
_M.CAMP.nested_types = {}
_M.CAMP.enum_types = {}
_M.CAMP.fields = {_M.CAMP_CAMP_FIELD, _M.CAMP_REEDTOWER_FIELD}
_M.CAMP.is_extendable = false
_M.CAMP.extensions = {}
_M.REEDTOWER_ID_FIELD.name = "id"
_M.REEDTOWER_ID_FIELD.full_name = ".ReedTower.id"
_M.REEDTOWER_ID_FIELD.number = 1
_M.REEDTOWER_ID_FIELD.index = 0
_M.REEDTOWER_ID_FIELD.label = 1
_M.REEDTOWER_ID_FIELD.has_default_value = false
_M.REEDTOWER_ID_FIELD.default_value = 0
_M.REEDTOWER_ID_FIELD.type = 5
_M.REEDTOWER_ID_FIELD.cpp_type = 1

_M.REEDTOWER_RESULT_FIELD.name = "result"
_M.REEDTOWER_RESULT_FIELD.full_name = ".ReedTower.result"
_M.REEDTOWER_RESULT_FIELD.number = 2
_M.REEDTOWER_RESULT_FIELD.index = 1
_M.REEDTOWER_RESULT_FIELD.label = 1
_M.REEDTOWER_RESULT_FIELD.has_default_value = false
_M.REEDTOWER_RESULT_FIELD.default_value = 0
_M.REEDTOWER_RESULT_FIELD.type = 5
_M.REEDTOWER_RESULT_FIELD.cpp_type = 1

_M.REEDTOWER.name = "ReedTower"
_M.REEDTOWER.full_name = ".ReedTower"
_M.REEDTOWER.nested_types = {}
_M.REEDTOWER.enum_types = {}
_M.REEDTOWER.fields = {_M.REEDTOWER_ID_FIELD, _M.REEDTOWER_RESULT_FIELD}
_M.REEDTOWER.is_extendable = false
_M.REEDTOWER.extensions = {}

_M.Camp = protobuf.Message(_M.CAMP)
_M.ReedTower = protobuf.Message(_M.REEDTOWER)
_M.get_reed_tower_request = protobuf.Message(_M.GET_REED_TOWER_REQUEST)
_M.get_reed_tower_response = protobuf.Message(_M.GET_REED_TOWER_RESPONSE)

return _M