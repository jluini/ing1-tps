!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'board state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'playing' stamp: 'jml 11/7/2018 00:33:28'!
moveFrom: fromPosition to: toPosition 
	
	state moveFrom: fromPosition to: toPosition! !

!TerniLapilli methodsFor: 'playing' stamp: 'jml 11/7/2018 00:33:35'!
placePieceAt: aPosition
	
	state placePieceAt: aPosition! !


!TerniLapilli methodsFor: 'testing' stamp: 'la 11/7/2018 03:16:42'!
canAddMorePieces
	
	^ state canAddMorePieces ! !

!TerniLapilli methodsFor: 'testing' stamp: 'jml 11/7/2018 00:13:05'!
isFinished
	
	^ state isFinished ! !

!TerniLapilli methodsFor: 'testing' stamp: 'jml 11/7/2018 00:49:32'!
isWonForO
	
	^ state isWonForO! !

!TerniLapilli methodsFor: 'testing' stamp: 'jml 11/7/2018 00:49:44'!
isWonForX
	
	^ state isWonForX! !


!TerniLapilli methodsFor: 'accessing' stamp: 'jml 11/7/2018 18:47:19'!
hasOAt: aPosition

	^ board has: TerniLapilli oPlayer at: aPosition! !

!TerniLapilli methodsFor: 'accessing' stamp: 'jml 11/7/2018 18:47:34'!
hasXAt: aPosition

	^ board has: TerniLapilli xPlayer at: aPosition! !

!TerniLapilli methodsFor: 'accessing' stamp: 'jml 11/7/2018 01:11:02'!
positionIsEmpty: aPosition 

	^ board positionIsEmpty: aPosition! !

!TerniLapilli methodsFor: 'accessing' stamp: 'jml 11/7/2018 18:32:02'!
turn
	
	^ state turn! !


!TerniLapilli methodsFor: 'initialization' stamp: 'jml 11/7/2018 01:05:02'!
initialize

	board := TerniLapilliBoard new.
	state := XIsPlacingState for: self.! !


!TerniLapilli methodsFor: 'playing - private' stamp: 'jml 11/7/2018 18:43:42'!
moveOFrom: fromPosition to: toPosition
	
	| newState |
	
	board move: TerniLapilli oPlayer from: fromPosition to: toPosition.
	
	newState := (board isWinning: TerniLapilli oPlayer)
		ifTrue: [ OHasWonState ]
		ifFalse: [ XIsMovingState ]
	.
	
	state := newState for: self.! !

!TerniLapilli methodsFor: 'playing - private' stamp: 'jml 11/7/2018 18:44:09'!
moveXFrom: fromPosition to: toPosition
	
	| newState |
	
	board move: TerniLapilli xPlayer from: fromPosition to: toPosition.
	
	newState := (board isWinning: TerniLapilli xPlayer)
		ifTrue: [ XHasWonState ]
		ifFalse: [ OIsMovingState ]
	.
	
	state := newState for: self.! !

!TerniLapilli methodsFor: 'playing - private' stamp: 'jml 11/7/2018 18:44:32'!
placeOAt: aPosition 
	
	| newState |
	
	board place: TerniLapilli oPlayer at: aPosition.
	
	newState := (board isWinning: TerniLapilli oPlayer)
		ifTrue: [ OHasWonState ]
		ifFalse: [ board numberOfPieces = 6
			ifTrue: [ XIsMovingState ]
			ifFalse: [ XIsPlacingState ]
		]
	.
	
	state := newState for: self.! !

!TerniLapilli methodsFor: 'playing - private' stamp: 'jml 11/7/2018 18:44:19'!
placeXAt: aPosition 
	
	| newState |
	
	board place: TerniLapilli xPlayer at: aPosition.
	
	newState := (board isWinning: TerniLapilli xPlayer)
		ifTrue: [ XHasWonState ]
		ifFalse: [ OIsPlacingState ]
	.
	
	state := newState for: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'error descriptions' stamp: 'jml 11/5/2018 17:26:23'!
cannotAddMorePieces
	
	^ 'cannot add more than 6 pieces'! !

!TerniLapilli class methodsFor: 'error descriptions' stamp: 'jml 11/5/2018 20:33:44'!
cannotMoveYetErrorDescription

	^ 'cannot move'! !

!TerniLapilli class methodsFor: 'error descriptions' stamp: 'la 11/1/2018 20:34:33'!
finishedGameErrorDescription
	
	^ 'game is finished'! !

!TerniLapilli class methodsFor: 'error descriptions' stamp: 'jml 11/5/2018 17:25:45'!
invalidMoveErrorDescription

	^ 'invalid move'! !

!TerniLapilli class methodsFor: 'error descriptions' stamp: 'la 11/1/2018 20:09:56'!
invalidPositionErrorDescription

	^ 'invalid position'! !

!TerniLapilli class methodsFor: 'error descriptions' stamp: 'jml 11/5/2018 17:26:04'!
invalidTurnErrorDescription

	^ 'invalid turn'! !

!TerniLapilli class methodsFor: 'error descriptions' stamp: 'jml 11/5/2018 17:35:19'!
missingPieceErrorDescription
	
	^ 'piece not found'! !

!TerniLapilli class methodsFor: 'error descriptions' stamp: 'la 11/1/2018 20:24:14'!
occupiedPositionErrorDescription
	
	^ 'occupied position'! !


!TerniLapilli class methodsFor: 'players' stamp: 'jml 11/7/2018 18:22:30'!
oPlayer
	
	^ $O! !

!TerniLapilli class methodsFor: 'players' stamp: 'jml 11/7/2018 18:22:23'!
xPlayer
	
	^ $X! !


!classDefinition: #TerniLapilliBoard category: #TerniLapilli!
Object subclass: #TerniLapilliBoard
	instanceVariableNames: 'pieces'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliBoard methodsFor: 'initialization' stamp: 'jml 11/7/2018 01:02:59'!
initialize
	
	pieces := Dictionary new.! !


!TerniLapilliBoard methodsFor: 'testing - private' stamp: 'jml 11/7/2018 01:06:36'!
anyColumnIsFullOf: aPiece
	
	 ^ #(1 2 3) anySatisfy: [ :col | self col: col isFullOf: aPiece ]! !

!TerniLapilliBoard methodsFor: 'testing - private' stamp: 'jml 11/7/2018 01:11:36'!
anyDiagonalIsFullOf: aPiece
	
	^ (self leftDiagonalIsFullOf: aPiece) or: [ self rightDiagonalIsFullOf: aPiece ]! !

!TerniLapilliBoard methodsFor: 'testing - private' stamp: 'jml 11/7/2018 01:12:02'!
anyRowIsFullOf: aPiece
	
	^ #(1 2 3) anySatisfy: [ :row | self row: row isFullOf: aPiece ]! !

!TerniLapilliBoard methodsFor: 'testing - private' stamp: 'jml 11/7/2018 01:12:20'!
col: col isFullOf: aPiece
	
	^ #(1 2 3) allSatisfy: [ :row | self has: aPiece at: col@row ]! !

!TerniLapilliBoard methodsFor: 'testing - private' stamp: 'jml 11/7/2018 01:18:16'!
leftDiagonalIsFullOf: aPiece
	
	^ (Array with: 1@1 with: 2@2 with: 3@3) allSatisfy: [ :pos | self has: aPiece at: pos ]! !

!TerniLapilliBoard methodsFor: 'testing - private' stamp: 'jml 11/7/2018 01:19:25'!
rightDiagonalIsFullOf: aPiece
	
	^ (Array with: 1@3 with: 2@2 with: 3@1) allSatisfy: [ :pos | self has: aPiece at: pos ]! !

!TerniLapilliBoard methodsFor: 'testing - private' stamp: 'jml 11/7/2018 01:20:02'!
row: row isFullOf: aPiece
	
	^ #(1 2 3) allSatisfy: [ :col | self has: aPiece at: col@row ]! !


!TerniLapilliBoard methodsFor: 'testing' stamp: 'jml 11/7/2018 01:17:52'!
isWinning: aPlayer
	
	^ (self anyRowIsFullOf: aPlayer) or: [ (self anyColumnIsFullOf: aPlayer) or: [ self anyDiagonalIsFullOf: aPlayer ] ]! !


!TerniLapilliBoard methodsFor: 'accessing' stamp: 'jml 11/7/2018 01:09:36'!
has: aPiece at: aPosition
	
	^ (pieces includesKey: aPosition) and: [ (pieces at: aPosition) = aPiece ]! !

!TerniLapilliBoard methodsFor: 'accessing' stamp: 'jml 11/7/2018 01:31:36'!
numberOfPieces
	
	^ pieces size! !

!TerniLapilliBoard methodsFor: 'accessing' stamp: 'jml 11/7/2018 01:10:30'!
positionIsEmpty: aPosition 

	^ (pieces includesKey: aPosition) not! !


!TerniLapilliBoard methodsFor: 'playing' stamp: 'jml 11/7/2018 19:15:35'!
move: aPiece from: fromPosition to: toPosition
	
	self checkValidPosition: fromPosition.
	self checkValidPosition: toPosition.
	self checkPositionsAreConnected: fromPosition and: toPosition.
	self checkPiece: aPiece at: fromPosition.
	self checkEmptyPosition: toPosition.
	
	pieces removeKey: fromPosition.
	pieces at: toPosition put: aPiece.! !

!TerniLapilliBoard methodsFor: 'playing' stamp: 'jml 11/7/2018 19:07:47'!
place: aPiece at: aPosition
	
	self checkValidPosition: aPosition.
	self checkEmptyPosition: aPosition.
	
	pieces at: aPosition put: aPiece.! !


!TerniLapilliBoard methodsFor: 'checking' stamp: 'jml 11/7/2018 19:08:49'!
checkEmptyPosition: aPosition

	(self positionIsEmpty: aPosition) ifFalse: [
		self error: TerniLapilli occupiedPositionErrorDescription
	].! !

!TerniLapilliBoard methodsFor: 'checking' stamp: 'jml 11/7/2018 19:15:12'!
checkPiece: aPiece at: aPosition
	
	(self has: aPiece at: aPosition) ifFalse: [
		self error: TerniLapilli missingPieceErrorDescription
	].! !

!TerniLapilliBoard methodsFor: 'checking' stamp: 'jml 11/7/2018 19:14:09'!
checkPositionsAreConnected: fromPosition and: toPosition
	
	(self class positionsAreConnected: fromPosition and: toPosition) ifFalse: [
		self error: TerniLapilli invalidMoveErrorDescription
	].
	! !

!TerniLapilliBoard methodsFor: 'checking' stamp: 'jml 11/7/2018 19:08:43'!
checkValidPosition: aPosition
	
	(self class isValidPosition: aPosition) ifFalse: [
		self error: TerniLapilli invalidPositionErrorDescription
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliBoard class' category: #TerniLapilli!
TerniLapilliBoard class
	instanceVariableNames: ''!

!TerniLapilliBoard class methodsFor: 'positions' stamp: 'jml 11/7/2018 01:15:12'!
horizontalDistanceBetween: fromPosition and: toPosition
	
	^ (fromPosition x - toPosition x) abs! !

!TerniLapilliBoard class methodsFor: 'positions' stamp: 'jml 11/7/2018 01:15:32'!
isNotDiamondPosition: aPosition
	
	^ (aPosition x + aPosition y) even! !

!TerniLapilliBoard class methodsFor: 'positions' stamp: 'jml 11/7/2018 01:15:49'!
isValidCoordinate: aCoordinate
	
	^ aCoordinate between: 1 and: 3! !

!TerniLapilliBoard class methodsFor: 'positions' stamp: 'jml 11/7/2018 01:16:14'!
isValidPosition: aPosition
	
	^ (self isValidCoordinate: aPosition x) and: [ self isValidCoordinate: aPosition y ]! !

!TerniLapilliBoard class methodsFor: 'positions' stamp: 'jml 11/7/2018 01:20:56'!
positionsAreAdjacent: fromPosition and: toPosition
	
	| horizontalDistance verticalDistance |
	
	horizontalDistance := self horizontalDistanceBetween: fromPosition and: toPosition.
	verticalDistance := self verticalDistanceBetween: fromPosition and: toPosition.
	
	^ horizontalDistance + verticalDistance = 1! !

!TerniLapilliBoard class methodsFor: 'positions' stamp: 'jml 11/7/2018 01:20:44'!
positionsAreConnected: fromPosition and: toPosition
	
	^ (self positionsAreAdjacent: fromPosition and: toPosition) or: [ self positionsAreDiagonallyConnected: fromPosition and: toPosition ]! !

!TerniLapilliBoard class methodsFor: 'positions' stamp: 'jml 11/7/2018 01:20:22'!
positionsAreDiagonallyConnected: fromPosition and: toPosition
	
	| horizontalDistance verticalDistance |
	
	horizontalDistance := self horizontalDistanceBetween: fromPosition and: toPosition.
	verticalDistance := self verticalDistanceBetween: fromPosition and: toPosition.
	
	^ (horizontalDistance = 1) and: [ verticalDistance = 1 and: [ self isNotDiamondPosition: fromPosition ] ]! !

!TerniLapilliBoard class methodsFor: 'positions' stamp: 'jml 11/7/2018 01:19:44'!
verticalDistanceBetween: fromPosition and: toPosition
	
	^ (fromPosition y - toPosition y) abs! !


!classDefinition: #TerniLapilliState category: #TerniLapilli!
Object subclass: #TerniLapilliState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliState methodsFor: 'initialization' stamp: 'jml 11/6/2018 14:34:23'!
initializeFor: aGame

	game := aGame! !


!TerniLapilliState methodsFor: 'playing' stamp: 'jml 11/7/2018 00:52:28'!
moveFrom: fromPosition to: toPosition 

	self subclassResponsibility! !

!TerniLapilliState methodsFor: 'playing' stamp: 'jml 11/7/2018 00:52:43'!
placePieceAt: aPosition

	self subclassResponsibility! !


!TerniLapilliState methodsFor: 'testing' stamp: 'jml 11/7/2018 18:28:24'!
canAddMorePieces
	
	self subclassResponsibility! !

!TerniLapilliState methodsFor: 'testing' stamp: 'jml 11/7/2018 00:51:59'!
isFinished
	
	self subclassResponsibility! !

!TerniLapilliState methodsFor: 'testing' stamp: 'jml 11/7/2018 00:39:56'!
isWonForO
	
	self subclassResponsibility! !

!TerniLapilliState methodsFor: 'testing' stamp: 'jml 11/7/2018 00:39:52'!
isWonForX
	
	self subclassResponsibility! !


!TerniLapilliState methodsFor: 'accessing' stamp: 'la 11/7/2018 03:15:31'!
turn

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliState class' category: #TerniLapilli!
TerniLapilliState class
	instanceVariableNames: ''!

!TerniLapilliState class methodsFor: 'instance creation' stamp: 'jml 11/8/2018 00:56:15'!
for: aGame
	
	^ self new initializeFor: aGame! !


!classDefinition: #GameOverState category: #TerniLapilli!
TerniLapilliState subclass: #GameOverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!GameOverState methodsFor: 'playing' stamp: 'jml 11/6/2018 14:55:59'!
moveFrom: fromPosition to: toPosition 

	^ self error: game class finishedGameErrorDescription! !

!GameOverState methodsFor: 'playing' stamp: 'jml 11/6/2018 14:55:32'!
placePieceAt: aPosition

	^ self error: game class finishedGameErrorDescription! !


!GameOverState methodsFor: 'testing' stamp: 'jml 11/7/2018 18:32:34'!
canAddMorePieces
	
	self error: game class finishedGameErrorDescription! !

!GameOverState methodsFor: 'testing' stamp: 'jml 11/6/2018 14:56:11'!
isFinished
	
	^ true! !


!GameOverState methodsFor: 'accessing' stamp: 'jml 11/7/2018 18:20:18'!
turn

	self error: game class finishedGameErrorDescription! !


!classDefinition: #OHasWonState category: #TerniLapilli!
GameOverState subclass: #OHasWonState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!OHasWonState methodsFor: 'testing' stamp: 'jml 11/7/2018 00:40:41'!
isWonForO
	
	^ true! !

!OHasWonState methodsFor: 'testing' stamp: 'jml 11/7/2018 00:40:36'!
isWonForX
	
	^ false! !


!classDefinition: #XHasWonState category: #TerniLapilli!
GameOverState subclass: #XHasWonState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!XHasWonState methodsFor: 'testing' stamp: 'jml 11/7/2018 00:42:59'!
isWonForO
	
	^ false! !

!XHasWonState methodsFor: 'testing' stamp: 'jml 11/7/2018 00:42:54'!
isWonForX
	
	^ true! !


!classDefinition: #PlayingState category: #TerniLapilli!
TerniLapilliState subclass: #PlayingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlayingState methodsFor: 'testing' stamp: 'jml 11/6/2018 14:57:45'!
isFinished
	
	^ false! !

!PlayingState methodsFor: 'testing' stamp: 'jml 11/7/2018 00:43:13'!
isWonForO
	
	^ false! !

!PlayingState methodsFor: 'testing' stamp: 'jml 11/7/2018 00:43:12'!
isWonForX
	
	^ false! !


!classDefinition: #MovingState category: #TerniLapilli!
PlayingState subclass: #MovingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!MovingState methodsFor: 'playing' stamp: 'jml 11/6/2018 15:02:32'!
placePieceAt: aPosition
	
	^ self error: game class cannotAddMorePieces! !


!MovingState methodsFor: 'testing' stamp: 'jml 11/7/2018 18:30:51'!
canAddMorePieces

	^ false! !


!classDefinition: #OIsMovingState category: #TerniLapilli!
MovingState subclass: #OIsMovingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!OIsMovingState methodsFor: 'playing' stamp: 'jml 11/6/2018 23:36:10'!
moveFrom: fromPosition to: toPosition 
	
	game moveOFrom: fromPosition to: toPosition ! !


!OIsMovingState methodsFor: 'accessing' stamp: 'jml 11/7/2018 18:21:51'!
turn
	
	^ game class oPlayer! !


!classDefinition: #XIsMovingState category: #TerniLapilli!
MovingState subclass: #XIsMovingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!XIsMovingState methodsFor: 'playing' stamp: 'jml 11/6/2018 23:36:02'!
moveFrom: fromPosition to: toPosition 
	
	game moveXFrom: fromPosition to: toPosition! !


!XIsMovingState methodsFor: 'accessing' stamp: 'jml 11/7/2018 18:21:45'!
turn
	
	^ game class xPlayer! !


!classDefinition: #PlacingState category: #TerniLapilli!
PlayingState subclass: #PlacingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlacingState methodsFor: 'playing' stamp: 'jml 11/6/2018 14:49:35'!
moveFrom: fromPosition to: toPosition 

	^self error: game class cannotMoveYetErrorDescription! !


!PlacingState methodsFor: 'testing' stamp: 'jml 11/7/2018 18:30:33'!
canAddMorePieces

	^ true! !


!classDefinition: #OIsPlacingState category: #TerniLapilli!
PlacingState subclass: #OIsPlacingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!OIsPlacingState methodsFor: 'playing' stamp: 'jml 11/6/2018 14:54:15'!
placePieceAt: aPosition

	game placeOAt: aPosition! !


!OIsPlacingState methodsFor: 'accessing' stamp: 'jml 11/7/2018 18:21:59'!
turn
	
	^ game class oPlayer! !


!classDefinition: #XIsPlacingState category: #TerniLapilli!
PlacingState subclass: #XIsPlacingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!XIsPlacingState methodsFor: 'playing' stamp: 'jml 11/6/2018 14:55:17'!
placePieceAt: aPosition
	
	game placeXAt: aPosition! !


!XIsPlacingState methodsFor: 'accessing' stamp: 'jml 11/7/2018 18:21:37'!
turn
	
	^ game class xPlayer! !
