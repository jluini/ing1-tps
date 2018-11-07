!classDefinition: #TerniLapilliTest category: #'TerniLapilli-Tests'!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: 'emptyGame moveGame'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli-Tests'!

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 03:02:46'!
setUp

	moveGame := TerniLapilli new.
	moveGame placePieceAt: 1@1.
	moveGame placePieceAt: 3@1.
	moveGame placePieceAt: 1@2.
	moveGame placePieceAt: 3@2.
	moveGame placePieceAt: 3@3.
	moveGame placePieceAt: 1@3.
	
	emptyGame := TerniLapilli new.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 03:03:47'!
test01BoardIsInitiallyEmpty

	self assert: (self boardIsEmpty: emptyGame).! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 01:58:40'!
test02_01XHasPosition

	| game position|
	
	position := 1@1.
	game := TerniLapilli new.
	game placePieceAt: position.
	
	self assert: (game hasXAt: position).
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 02:01:44'!
test02_02XhasntPositionAt

	| game position|
	
	position := 1@1.
	game := TerniLapilli new.
	game placePieceAt: position.
	
	self deny: (game hasOAt: position).
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 02:02:16'!
test02_03PositionIsNotEmpty

	| game position|
	
	position := 1@1.
	game := TerniLapilli new.
	game placePieceAt: position.

	self deny: (game positionIsEmpty: position).	
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 02:02:34'!
test02_04RestOfPositionAreEmpty

	| game position restOfPositions |
	
	position := 1@1.
	restOfPositions := self allPositions.
	restOfPositions remove: position.
	game := TerniLapilli new.
	game placePieceAt: position.

	self assert: (restOfPositions allSatisfy: [ :aPosition | game positionIsEmpty: aPosition ]).
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 02:06:13'!
test02_05OCannotPlayFirst

	| game position |
	
	position := 1@1.

	game := TerniLapilli new.
	game placePieceAt: position.

	self deny: (game hasOAt: position).! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 01:47:50'!
test02_2OCanPlayAtSomePosition

	| game positionX positionO restOfPositions |
	
	positionX := 1@1.
	positionO:= 1@2.
	restOfPositions := self allPositions.
	restOfPositions remove: positionX.

	game := TerniLapilli new.
	game placePieceAt: positionX.
	game placePieceAt: positionO.
	
	self assert: (game hasOAt: positionO).
	self deny: (game hasXAt: positionO).
	self deny: (game positionIsEmpty: positionO).! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 02:02:51'!
test02_testOriginalToRemove

	| game position restOfPositions |
	
	position := 1@1.
	restOfPositions := self allPositions.
	restOfPositions remove: position.
	game := TerniLapilli new.
	game placePieceAt: position.
	
	self assert: (game hasXAt: position).
	self deny: (game hasOAt: position).
	self deny: (game positionIsEmpty: position).	
	self assert: (restOfPositions allSatisfy: [ :aPosition | game positionIsEmpty: aPosition ]).
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/6/2018 15:09:55'!
test03OCanPlayAfterX

	| game xPosition oPosition |
	
	xPosition := 1@1.
	oPosition := 1@3.
	
	game := TerniLapilli new.
	game placePieceAt: xPosition.
	game placePieceAt: oPosition.

	self assert: (game hasOAt: oPosition).
	self deny: (game hasXAt: oPosition).
	self deny: (game positionIsEmpty: oPosition).
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 02:04:19'!
test07_01CannotPlayAtLeftInvalidPosition
	|game anInvalidPosition |
	
	anInvalidPosition := 0@1.
	
	game := TerniLapilli new.
	
	self should: [game placePieceAt: anInvalidPosition ] raise: Exception withExceptionDo: [ :exception |
		self assert:  (exception messageText ) equals: (TerniLapilli invalidPositionErrorDescription).
		self assert: (self boardIsEmpty: game).
	].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 02:04:31'!
test07_02CannotPlayAtRightInvalidPosition
	|game anInvalidPosition |
	
	anInvalidPosition := 5@1.
	
	game := TerniLapilli new.
	
	self should: [game placePieceAt: anInvalidPosition ] raise: Exception withExceptionDo: [ :exception |
		self assert:  (exception messageText ) equals: (TerniLapilli invalidPositionErrorDescription).
		self assert: (self boardIsEmpty: game).
	].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 02:05:07'!
test07_03CannotPlayAtLowerInvalidPosition
	|game anInvalidPosition |
	
	anInvalidPosition := 1@5.
	
	game := TerniLapilli new.
	
	self should: [game placePieceAt: anInvalidPosition ] raise: Exception withExceptionDo: [ :exception |
		self assert:  (exception messageText ) equals: (TerniLapilli invalidPositionErrorDescription).
		self assert: (self boardIsEmpty: game).
	].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 02:05:19'!
test07_04CannotPlayAtUpperInvalidPosition
	|game anInvalidPosition |
	
	anInvalidPosition := 1@0.
	
	game := TerniLapilli new.
	
	self should: [game placePieceAt: anInvalidPosition ] raise: Exception withExceptionDo: [ :exception |
		self assert:  (exception messageText ) equals: (TerniLapilli invalidPositionErrorDescription).
		self assert: (self boardIsEmpty: game).
	].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/6/2018 15:09:55'!
test08CannotPlayAtAnOccupiedPosition
	
	| aPosition game |
	
	game := TerniLapilli new.
	aPosition := 2@2.
	
	game placePieceAt: aPosition.
	
	self should: [ game placePieceAt: aPosition ] raise: Error withExceptionDo: [ :anException |
		self assert: anException messageText equals: TerniLapilli occupiedPositionErrorDescription.
		self assert: (game hasXAt: aPosition).
		self deny: (game hasOAt: aPosition).
		self deny: (game positionIsEmpty: aPosition).
	].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/7/2018 00:49:44'!
test09InitiallyWonGameForColumnsIsFinished
	
	| game |
	
	game := TerniLapilli new.
	
	game placePieceAt: 1@1.
	game placePieceAt: 2@2.
	game placePieceAt: 1@2.
	game placePieceAt: 3@3.
	game placePieceAt: 1@3.
	
	self assert: game isFinished.
	self assert: game isWonForX.
	self deny: game isWonForO.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/7/2018 00:49:44'!
test10InitiallyWonGameForRowIsFinished
	
	| game |
	
	game := TerniLapilli new.
	
	game placePieceAt: 1@1.
	game placePieceAt: 2@2.
	game placePieceAt: 2@1.
	game placePieceAt: 3@3.
	game placePieceAt: 3@1.

	self assert: game isFinished.
	self assert: game isWonForX.
	self deny: game isWonForO.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/7/2018 00:49:44'!
test11InitiallyWonGameForDiagonalIsFinished
	
	| game |
	
	game := TerniLapilli new.
	
	game placePieceAt: 1@1.
	game placePieceAt: 1@3.
	game placePieceAt: 2@2.
	game placePieceAt: 3@1.
	game placePieceAt: 3@3.
	
	self assert: game isFinished.
	self assert: game isWonForX.
	self deny: game isWonForO.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 02:01:12'!
test11_01InitiallyWonGameForColumnsIsFinished
	
	| game |
	
	game := TerniLapilli new.
	
	game placePieceAt: 1@1.
	game placePieceAt: 2@2.
	game placePieceAt: 1@2.
	game placePieceAt: 3@3.
	game placePieceAt: 1@3.
	
	self assert: game isFinished.
	self assert: game isWonForX.
	self deny: game isWonForO.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 02:24:46'!
test11_01OcanWin
	
	| game |
	
	game := TerniLapilli new.
	
	game placePieceAt: 1@2.
	game placePieceAt: 1@1.
	game placePieceAt: 2@1.
	game placePieceAt: 2@2.
	game placePieceAt: 1@3.
	game placePieceAt: 3@3.
		
	self assert: game isFinished.
	self assert: game isWonForO.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/6/2018 15:07:36'!
test12CannotPlayWhenGameIsFinished
	| game |
	
	game := TerniLapilli new.
	
	game placePieceAt: 1@1.
	game placePieceAt: 2@1.
	game placePieceAt: 1@2.
	game placePieceAt: 2@2.
	game placePieceAt: 1@3.
	
	self should: [ game placePieceAt: 2@3 ] raise: Error withExceptionDo: [ : anException |
		self assert: anException messageText equals: TerniLapilli finishedGameErrorDescription.
		self assert: (game positionIsEmpty: 2@3).
	].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/6/2018 15:14:50'!
test13GameInitialPhaseFinishedWhitoutWinner
	
	| game |
	
	game := TerniLapilli new.
	
	game placePieceAt: 1@1.
	game placePieceAt: 2@1.
	game placePieceAt: 1@2.
	game placePieceAt: 2@2.
	game placePieceAt: 2@3.
	game placePieceAt: 1@3.
	
	self deny: game isFinished.
	
	self should: [ game placePieceAt: 3@3 ] raise: Error withExceptionDo: [ : anException |
		self assert: anException messageText equals: TerniLapilli cannotAddMorePieces.
		self assert: (game positionIsEmpty: 3@3).
	].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/6/2018 15:15:01'!
test14gameInitialPhaseNotFinished
	
	| game |
	
	game := TerniLapilli new.
	game placePieceAt: 1@1.
	
	self deny: game isFinished.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/6/2018 15:09:45'!
test15InvalidMovementBecauseOfInvalidPositions
	
	| game |
	
	game := TerniLapilli new.
	
	game placePieceAt: 1@1.
	game placePieceAt: 3@1.
	game placePieceAt: 1@2.
	game placePieceAt: 3@2.
	game placePieceAt: 3@3.
	game placePieceAt: 1@3.
	
	self should: [game moveFrom: 1@1 to: 0@0] raise: Error withExceptionDo: [ : anException |
		self assert: anException messageText equals: TerniLapilli invalidPositionErrorDescription.
		self assert: (game hasXAt: 1@1).
	].
	
	self should: [game moveFrom: 4@3 to: 2@2] raise: Error withExceptionDo: [ : anException |
		self assert: anException messageText equals: TerniLapilli invalidPositionErrorDescription.
		self assert: (game positionIsEmpty: 2@2).	
	].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/6/2018 15:09:55'!
test16InvalidMovementBecauseOfMissingPiece
	
	| game |
	
	game := TerniLapilli new.
	
	game placePieceAt: 1@1.
	game placePieceAt: 3@1.
	game placePieceAt: 1@2.
	game placePieceAt: 3@2.
	game placePieceAt: 3@3.
	game placePieceAt: 1@3.
	
	self should: [game moveFrom: 3@1 to: 2@1 ] raise: Error withExceptionDo: [ : anException |
		self assert: anException messageText equals: TerniLapilli missingPieceErrorDescription.
		self assert: (game hasOAt: 3@1).
		self assert: (game positionIsEmpty: 2@1).
	].
	
	self should: [game moveFrom: 2@2 to: 2@1] raise: Error withExceptionDo: [ : anException |
		self assert: anException messageText equals: TerniLapilli missingPieceErrorDescription.
		self assert: (game positionIsEmpty: 2@2).
		self assert: (game positionIsEmpty: 2@1)
	].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/6/2018 15:09:45'!
test17InvalidMovementBecauseOfUnconnectedPositions
	
	| game |
	
	game := TerniLapilli new.
	
	game placePieceAt: 1@1.
	game placePieceAt: 3@1.
	game placePieceAt: 1@2.
	game placePieceAt: 3@2.
	game placePieceAt: 3@3.
	game placePieceAt: 1@3.
	
	self should: [ game moveFrom: 1@2 to: 2@1 ] raise: Error withExceptionDo: [ : anException |
		self assert: anException messageText equals: TerniLapilli invalidMoveErrorDescription.
		self assert: (game hasXAt: 1@2).
		self assert: (game positionIsEmpty: 2@1)
	].
	
	self should: [ game moveFrom: 1@1 to: 2@3 ] raise: Error withExceptionDo: [ : anException |
		self assert: anException messageText equals: TerniLapilli invalidMoveErrorDescription.
		self assert: (game hasXAt: 1@1).
		self assert: (game positionIsEmpty: 2@3)	
	].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/7/2018 00:08:03'!
test17_02InvalidMovementBecauseOfOccupiedDestination
	
	| game |
	
	game := TerniLapilli new.
	
	game placePieceAt: 1@1.
	game placePieceAt: 3@1.
	game placePieceAt: 1@2.
	game placePieceAt: 3@2.
	game placePieceAt: 3@3.
	game placePieceAt: 2@3.
	
	self should: [ game moveFrom: 3@3 to: 2@3 ] raise: Error withExceptionDo: [ : anException |
		self assert: anException messageText equals: TerniLapilli occupiedPositionErrorDescription.
		self assert: (game hasXAt: 3@3).
		self assert: (game hasOAt: 2@3).
	].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/6/2018 15:09:45'!
test18CanMove
	
	| game |
	
	game := TerniLapilli new.
	
	game placePieceAt: 1@1.
	game placePieceAt: 3@1.
	game placePieceAt: 1@2.
	game placePieceAt: 3@2.
	game placePieceAt: 3@3.
	game placePieceAt: 1@3.
	game moveFrom: 1@1 to: 2@2.

	self assert: (game positionIsEmpty: 1@1).
	self assert: (game hasXAt: 2@2).
	self deny: game isFinished
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/6/2018 15:09:55'!
test19OCanMoveAfterX
	
	| game |
	
	game := TerniLapilli new.
	
	game placePieceAt: 1@1.
	game placePieceAt: 3@1.
	game placePieceAt: 1@2.
	game placePieceAt: 3@2.
	game placePieceAt: 3@3.
	game placePieceAt: 1@3.
	game moveFrom: 1@1 to: 2@2.
	game moveFrom: 1@3 to: 2@3.

	self assert: (game positionIsEmpty: 1@3).
	self assert: (game hasOAt: 2@3).
	self deny: game isFinished.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/6/2018 15:00:01'!
test20WonAfterAMove
	
	| game |
	
	game := TerniLapilli new.
	
	game placePieceAt: 1@1.
	game placePieceAt: 3@1.
	game placePieceAt: 1@2.
	game placePieceAt: 3@2.
	game placePieceAt: 3@3.
	game placePieceAt: 1@3.
	game moveFrom: 1@2 to: 2@2.
	
	self assert: game isFinished
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/6/2018 15:09:55'!
test21CannotMoveWhenGameIsFinished
	| game |
	game := TerniLapilli new.
	
	game placePieceAt: 1@1.
	game placePieceAt: 3@1.
	game placePieceAt: 1@2.
	game placePieceAt: 3@2.
	game placePieceAt: 3@3.
	game placePieceAt: 1@3.
	game moveFrom: 1@2 to: 2@2.
	
	self should: [ game moveFrom: 3@1 to: 2@1 ] raise: Error withExceptionDo: [ : anException |
		self assert: anException messageText equals: TerniLapilli finishedGameErrorDescription.
		self assert: (game hasOAt: 3@1).
		self assert: (game positionIsEmpty: 2@1).
	].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/6/2018 15:00:01'!
test22CannontMoveDuringInitialPhase

	| game |	
	game := TerniLapilli new.
	game placePieceAt: 1@1.
	game placePieceAt: 1@2.
	
	self should: [ game moveFrom: 1@1 to: 2@1. ] raise: Error withExceptionDo: [ :anException |
		self assert: anException messageText equals: TerniLapilli cannotMoveYetErrorDescription.
	].
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 02:36:56'!
test90PutXTurn

	| game |	
	game := TerniLapilli new.
	
	self assert: game turn = 'X turn'! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 02:37:08'!
test91PutOTurn

	| game |	
	game := TerniLapilli new.
	game placePieceAt: 1@1.	
	self assert: game turn = 'O turn'! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 03:02:46'!
test92MoveXTurn

		
	self assert: moveGame turn = 'X turn'! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 03:02:46'!
test93MoveOTurn

	moveGame moveFrom: 1@1 to: 2@2.
	
	self assert: moveGame turn = 'O turn'! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 03:08:14'!
test94CanAddMorePiecesInAEmptyBoard
	
	self assert: emptyGame canAddMorePIeces = 'Can add more pieces'! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/7/2018 03:09:17'!
test95CanAddMorePiecesInANotEmptyBoard
	
	emptyGame placePieceAt: 1@1.

	self assert: emptyGame canAddMorePIeces = 'Can add more pieces'! !


!TerniLapilliTest methodsFor: 'positions' stamp: 'jml 11/5/2018 19:14:42'!
allPositions
	| positions |
	
	positions := Set new.
	
	(1 to: 3) do: [ :row |
		(1 to: 3) do: [ :col |
			positions add: (Point x: col y: row)
		]
	].
	
	^ positions! !


!TerniLapilliTest methodsFor: 'checking' stamp: 'jml 11/6/2018 15:07:35'!
boardIsEmpty: aGame
	
	^ self allPositions allSatisfy: [ :aPosition | aGame positionIsEmpty: aPosition ]! !