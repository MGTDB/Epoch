params [["_trgt",player],"_targetPos","_unit","_grp","_driver"];
_targetPos = getPosATL _trgt;
_targetPos = [_targetPos, 600, 1200, 5, 0, 400, 0] call BIS_fnc_findSafePos;
_targetPos set[2, 600];
_unit = createVehicle["I_UAV_01_F", _targetPos, [], 0, "FLY"];
_unit disableTIEquipment true;
addToRemainsCollector[_unit];
_unit flyInHeight 600;
_grp = createGroup RESISTANCE;
_driver = _grp createUnit["I_UAV_AI", position _unit, [], 0, "CAN_COLLIDE"];
_driver moveInAny _unit;
[_unit, _trgt] execFSM "\x\addons\a3_epoch_code\System\Copter_brain.fsm";
