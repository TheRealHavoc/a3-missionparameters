/*
	Customization options.
*/
_markerName = "respawn_west";
_markerType = "respawn_inf";
_markerColor = "colorBLUFOR";
_startingPositionRadius = 100;
_removableObjectsPrefix = "removable_"; // All objects of which the variable name starts with this prefix within the radius of a starting position will be removed.

/*
	All possible starting positions.
	The amount of "rows" must be the same amount as the values and texts in the parameter.
*/
_startingPositions = [
/*	Marker text			Variable name of the marker */
	["Factory", 		"starting_position_1"],
	["Nidek", 			"starting_position_2"],
	["Military Base", 	"starting_position_3"],
	["Livonia Airport", "starting_position_4"]
];

// Get all necessary information regarding the starting points
_selectedStartingPositionIndex = paramsArray # 0;
_selectedStartingPositionName = (_startingPositions # _selectedStartingPositionIndex) # 0;
_selectedStartingPositionMarker = [_startingPositions, _selectedStartingPositionName] call BIS_fnc_getFromPairs;

// Create the starting point
_respawnWest = createMarker [_markerName, getMarkerPos _selectedStartingPositionMarker];
_respawnWest setMarkerType _markerType;
_respawnWest setMarkerColor _markerColor;
_respawnWest setMarkerText _selectedStartingPositionName;

// Remove objects in all the other spawn areas
{
	_marker = (_x # 1);
	if(_marker != _selectedStartingPositionMarker) then {
		{
			if(str _x find _removableObjectsPrefix >= 0) then {
				deleteVehicle _x;
			}
		} foreach (getMarkerPos _marker nearEntities _startingPositionRadius);
	};
} forEach _startingPositions;