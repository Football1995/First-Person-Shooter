-- This is where the game logic is updated and is run every game update

-- For Debugging/Scene testing
if isKeyDown("p") == true then
	reloadScene()
end

if getActiveScene() == "ShooterTest.xml" then
	hideCursor(true)
	-- Player Controls
	if isKeyDown("w") == true then
		player:pMove(0,0,1,playerSpeed)		-- Move Forwards
	elseif isKeyDown("s") == true then
		player:pMove(0,0,-1,playerSpeed)		--Move Backwards
	end

	--Jump
	if isKeyDown("space") == true then
		if jumpTimer:getElapsed() > playerJumpDelay then
			player:pMove(0,1,0,playerJumpForce)
			jumpTimer:reset()
		end
	end

	--Collect Pickup
	iCollision = player:pHasCollidedByName("pickup")
	if iCollision > -1 then
		destroyEntity(iCollision)
		iCollected = iCollected + 1
		player:log()
	end

	--Collect Pickup
	iCollision = player:pHasCollidedByName("Goal")
	if iCollision > -1 then
		
		player:log()
	end


	--Player Death plane
	if player:tGetPosY() < -1000 then
		player:tSetPosition(player:tGetPosX(),0,player:tGetPosZ())
	end

else
	hideCursor(false)
end

