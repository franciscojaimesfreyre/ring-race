tests
testWhenChangingGameStateItPreservesTheHistoryAndHasTheNewState
	|nico claudio aGameStateContext nicoState newGameState|
	
	nico := Player named: 'Nico'.
	claudio := Player named: 'Claudio'.
	
	aGameStateContext := GameStateContext withPlayers: { nico. claudio } in: (self board).
	
	nicoState := ( aGameStateContext currentState stateOf: nico ).
	newGameState := aGameStateContext currentState withNewPlayerState: ( nicoState positionedInSquare: 3 ) of: nico.
	aGameStateContext newStateFrom: newGameState.
	
	self assert: ( aGameStateContext currentState ) equals: newGameState.