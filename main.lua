require 'level'
width = 10
Xmap = 3
Ymap = 3
Zmap = 3
old = 0
new = 0
pressed = false

function love.load()
	orgmap = getlevel()
	map = getlevel()
	lastkey = '1'
	view = 1
	lastview = view
	x = 3
	y = 1
	z = 1
end

function love.update(dt)
	if pressed == true and lastkey == 'r' then
		for i = 1, Xmap+1 do
			for j = 1, Ymap+1 do
				for k = 1, Zmap+1 do
					map[i][j][k] = orgmap[i][j][k]
				end
			end
		end
		view = 1
		lastview = view
		x = 3
		y = 1
		z = 1
		width = 10
		Xmap = 3
		Ymap = 3
		Zmap = 3
		old = 0
		new = 0
		pressed = false
	end
	if new == 3 then
		new = 2
	end
	pressed,lastkey,lastview,view,x,y,z = move(pressed,lastkey,view,x,y,z)
end

function love.draw(dt)
	love.graphics.print(view..x..y..z,1000,100)
	printbg()
	printmap(view, x, y, z)
	for i,v in ipairs(map) do
		for j,t in ipairs(v) do
			for k,s in ipairs(t) do
				if map[i][j][z] == 1 then
					love.graphics.setColor(255,0,0)
					love.graphics.rectangle("fill", 16*i, 16*j, 16, 16)
				elseif map[i][j][z] == 2 then
					love.graphics.setColor(255,255,255)
					love.graphics.rectangle("fill", 16*i, 16*j, 16, 16)
				elseif map[i][j][z] == 3 then
					love.graphics.setColor(255,155,0)
					love.graphics.rectangle("fill", 16*i, 16*j, 16, 16)
				elseif map[i][j][z] == 4 then
					love.graphics.setColor(155,155,155)
					love.graphics.rectangle("fill", 16*i, 16*j, 16, 16)
				end
					love.graphics.setColor(255,255,255)
					love.graphics.rectangle("line", 16*i, 16*j, 16, 16)
				if map[x][j][k] == 1 then
					love.graphics.setColor(0,255,0)
					love.graphics.rectangle("fill", 172+16*k, 16*j, 16, 16)
				elseif map[x][j][k] == 2 then
					love.graphics.setColor(255,255,255)
					love.graphics.rectangle("fill", 172+16*k, 16*j, 16, 16)
				elseif map[x][j][k] == 3 then
					love.graphics.setColor(255,155,0)
					love.graphics.rectangle("fill", 172+16*k, 16*j, 16, 16)
				elseif map[x][j][k] == 4 then
					love.graphics.setColor(155,155,155)
					love.graphics.rectangle("fill", 172+16*k, 16*j, 16, 16)
				end
					love.graphics.setColor(255,255,255)
					love.graphics.rectangle("line", 172+16*k, 16*j, 16, 16)
				if map[i][y][k] == 1 then
					love.graphics.setColor(0,0,255)
					love.graphics.rectangle("fill", 16*i, 172+16*k, 16, 16)
				elseif map[i][y][k] == 2 then
					love.graphics.setColor(255,255,255)
					love.graphics.rectangle("fill", 16*i, 172+16*k, 16, 16)
				elseif map[i][y][k] == 3 then
					love.graphics.setColor(255,155,0)
					love.graphics.rectangle("fill", 16*i, 172+16*k, 16, 16)
				elseif map[i][y][k] == 4 then
					love.graphics.setColor(155,155,155)
					love.graphics.rectangle("fill", 16*i, 172+16*k, 16, 16)
				end
					love.graphics.setColor(255,255,255)
					love.graphics.rectangle("line", 16*i, 172+16*k, 16, 16)

			end
		end
	end
end

function love.keypressed(key)
	lastkey = key
	pressed = true
end

function printbg()
	for i = 1, width+1 do
		for j = 1, width+1 do
			for k = width, 1, -1 do
			local x1 = (i * 32) - (j * 32) + 700
			local x2 = x1 + 30
			local x3 = x1
			local x4 = x1 - 30
			local y1 = (((j * 32) + (i * 32)) / 2) + 10
			local y2 = y1 + 15
			local y3 = y1 + 30
			local y4 = y1 + 15
			if i == 1 or j == 1 or k == width then
					love.graphics.setColor(100, 100, 100,255)
					love.graphics.polygon('fill', x1, y1+(32*k)-32, x2, y2+(32*k)-32, x3, y3+(32*k)-32, x4, y4+(32*k)-32)
					love.graphics.setColor(0,0,0)
					love.graphics.polygon('line', x1, y1+(32*k)-32, x2, y2+(32*k)-32, x3, y3+(32*k)-32, x4, y4+(32*k)-32)
				
					love.graphics.setColor(100, 100, 100,255)
					love.graphics.polygon('fill', x3, y3+(32*k)-32, x4, y4+(32*k)-32, x4, y4+(32*k), x3, y3+(32*k))
					love.graphics.setColor(0,0,0)
					love.graphics.polygon('line', x3, y3+(32*k)-32, x4, y4+(32*k)-32, x4, y4+(32*k), x3, y3+(32*k))
					
					love.graphics.setColor(100, 100, 100,255)
					love.graphics.polygon('fill', x2, y2+(32*k)-32, x3, y3+(32*k)-32, x3, y3+(32*k), x2, y2+(32*k))
					love.graphics.setColor(0,0,0)
					love.graphics.polygon('line', x2, y2+(32*k)-32, x3, y3+(32*k)-32, x3, y3+(32*k), x2, y2+(32*k))
					end
			end
		end
	end
end

function printmap(view, x, y, z)
	for i = 1, Xmap+1 do
		for j = 1, Ymap+1 do
			for k = 1, Zmap+1 do
				local x1 = (k * 32) - (j * 32) + 700
				local x2 = x1 + 30
				local x3 = x1
				local x4 = x1 - 30
				local y1 = (((j * 32) + (k * 32)) / 2) + 300
				local y2 = y1 + 15
				local y3 = y1 + 30
				local y4 = y1 + 15
				if map[i][j][k] == 1 or (map[i][j][k] == 2 and k < Zmap and i < Xmap and j < Ymap) or ((map[i][j][k] == 3 or map[i][j][k] == 4) and k < Zmap and i < Xmap and j < Ymap+1)
					or ((map[i][j][k] == 3 or map[i][j][k] == 4) and k < Zmap and i < Xmap+1 and j < Ymap) or ((map[i][j][k] == 3 or map[i][j][k] == 4) and k < Zmap+1 and i < Xmap and j < Ymap) or ( k < Zmap and i < Xmap and j < Ymap) then
					if map[i][j][k] == 1 then
						r,g,b,a = 255,0,0,255
					elseif map[i][j][k] == 2 then
						r,g,b,a = 25,25,25,255
					elseif map[i][j][k] == 3 then
						r,g,b,a = 255,155,0,255
					elseif map[i][j][k] == 4 then
						r,g,b,a = 155,155,155,255
					elseif map[i][j][k] == 5 then
						r,g,b,a = 55,55,55,255
					else 
						r,g,b,a = 255,255,255,255
					end
					
					love.graphics.setColor(r,g,b,a)
					love.graphics.polygon('fill', x1, y1-(32*i)+32, x2, y2-(32*i)+32, x3, y3-(32*i)+32, x4, y4-(32*i)+32)
					love.graphics.setColor(0,0,0)
					love.graphics.polygon('line', x1, y1-(32*i)+32, x2, y2-(32*i)+32, x3, y3-(32*i)+32, x4, y4-(32*i)+32)
				
					love.graphics.setColor(b,g,r,a)
					love.graphics.polygon('fill', x3, y3-(32*i)+32, x4, y4-(32*i)+32, x4, y4-(32*i)+64, x3, y3-(32*i)+64)
					love.graphics.setColor(0,0,0)
					love.graphics.polygon('line', x3, y3-(32*i)+32, x4, y4-(32*i)+32, x4, y4-(32*i)+64, x3, y3-(32*i)+64)
					
					love.graphics.setColor(g,r,b,a)
					love.graphics.polygon('fill', x2, y2-(32*i)+32, x3, y3-(32*i)+32, x3, y3-(32*i)+64, x2, y2-(32*i)+64)
					love.graphics.setColor(0,0,0)
					love.graphics.polygon('line', x2, y2-(32*i)+32, x3, y3-(32*i)+32, x3, y3-(32*i)+64, x2, y2-(32*i)+64)
				end
			end
		end
	end
end

function move(pressed,lastkey,view,x,y,z)
if pressed == true then
	lastview = view
	if view == 1 then
		if lastkey == 'w' and y ~= 1 and map[x-1][y-1][z] ~= 2 then
			view,x,y,z = underplayer(lastview,view,x,y,z,0,-1,0)
			pressed = false
		elseif lastkey == 'a' and z ~= 1 and map[x-1][y][z-1] ~= 2 then
			view,x,y,z = underplayer(lastview,view,x,y,z,0,0,-1)
		elseif lastkey == 's' and ((map[x-1][y+1][z] ~= 2) or y+1 == Ymap) then
			if y+1 == Ymap then
				lastview = view
				view = 3
				view,x,y,z = underplayer(lastview,view,x,y,z,-1,1,0)
			elseif y < Ymap then
				view,x,y,z = underplayer(lastview,view,x,y,z,0,1,0)
			end
		elseif lastkey == 'd' and ((map[x-1][y][z+1] ~= 2)or z+1 == Zmap) then
			pressed = false
			if z+1 == Zmap then
				lastview = view
				view = 2
				view,x,y,z = underplayer(lastview,view,x,y,z,-1,0,1)
			elseif z < Zmap then
				view,x,y,z = underplayer(lastview,view,x,y,z,0,0,1)
			end
		end
	elseif view == 2 then
		if lastkey == 'w' and y ~= 1 and map[x][y-1][z-1] ~= 2 then
			view,x,y,z = underplayer(lastview,view,x,y,z,0,-1,0)
		elseif lastkey == 'a' and ((map[x+1][y][z-1] ~= 2) or x+1 == Xmap) then
			if x+1 == Xmap then
				lastview = view
				view = 1
				view,x,y,z = underplayer(lastview,view,x,y,z,1,0,-1)
			elseif x < Xmap then
				view,x,y,z = underplayer(lastview,view,x,y,z,1,0,0)
			end
		elseif lastkey == 's' and ((map[x][y+1][z-1] ~= 2) or y+1 == Ymap) then
			if y+1 == Ymap then
				lastview = view
				view = 3
				view,x,y,z = underplayer(lastview,view,x,y,z,0,1,-1)
			elseif y < Ymap then
				view,x,y,z = underplayer(lastview,view,x,y,z,0,1,0)
			end
		elseif lastkey == 'd' and x ~= 1 and map[x-1][y][z-1] ~= 2 then
			view,x,y,z = underplayer(lastview,view,x,y,z,-1,0,0)
		end
	elseif view == 3 then
		if lastkey == 'd' and ((map[x][y-1][z+1] ~= 2) or z+1 == Zmap) then
			if z+1 == Zmap then
				lastview = view
				view = 2
				view,x,y,z = underplayer(lastview,view,x,y,z,0,-1,1)
			elseif z < Zmap then
				view,x,y,z = underplayer(lastview,view,x,y,z,0,0,1)
				map[x][y][z] = 1
			end
		elseif lastkey == 'a' and z ~= 1 and map[x][y-1][z-1] ~= 2 then
			view,x,y,z = underplayer(lastview,view,x,y,z,0,0,-1)
		elseif lastkey == 's' and x ~= 1 and map[x-1][y-1][z] ~= 2 then
			view,x,y,z = underplayer(lastview,view,x,y,z,-1,0,0)
		elseif lastkey == 'w' and ((map[x+1][y-1][z] ~= 2) or x+1 == Xmap) then
			if x+1 == Xmap  then
				lastview = view
				view = 1
				view,x,y,z = underplayer(lastview,view,x,y,z,1,-1,0)
			elseif x < Xmap then
				view,x,y,z = underplayer(lastview,view,x,y,z,1,0,0)
				map[x][y][z] = 1
			end
		end
	end
	pressed = false
	end
	return pressed,lastkey,lastview,view,x,y,z
end

function underplayer(lastview,view,x,y,z,nx,ny,nz)
	if (view == 1 and map[x-1][y][z] == 5) then
		map[x-1][y][z] = 2
	elseif (view == 2 and map[x][y][z-1] == 5) then
		map[x][y][z-1] = 2
	elseif (view == 3 and map[x][y-1][z] == 5) then
		map[x][y-1][z] = 2
	end
	old = map[x+nx][y+ny][z+nz]
	if old == 3 then
		if view == 1 then
			Ymap = Ymap + 1
			Zmap = Zmap + 1
			updatemap()
		elseif view == 2 then
			Xmap = Xmap + 1
			Ymap = Ymap + 1
			updatemap()
		else
			Xmap = Xmap + 1
			Zmap = Zmap + 1
			updatemap()
		end
	end
	if old == 4 and x+nx+nx ~= 0 and y+ny+ny ~= 0 and z+nz+nz ~= 0 and map[x+nx+nx][y+ny+ny][z+nz+nz] ~= 3 and map[x+nx+nx][y+ny+ny][z+nz+nz] ~= 4 then
		if view == 1 and nx == 0 and z+nz+nz ~= Zmap and y+ny+ny ~= Ymap and map[x-1][y+ny+ny][z+nz+nz] ~= 2 then
			map[x+nx][y+ny+ny][z+nz+nz] = old
			old = new
			map[x][y][z] = new
			new = old
			x = x + nx
			y = y + ny
			z = z + nz
		elseif view == 2 and nz == 0 and y+ny+ny ~= Ymap and x+nx+nx ~= Xmap and map[x+nx+nx][y+ny+ny][z-1] ~= 2 then
			map[x+nx+nx][y+ny+ny][z+nz] = old
			old = new
			map[x][y][z] = new
			new = old
			x = x + nx
			y = y + ny
			z = z + nz
		elseif view == 3 and ny == 0 and x+nx+nx ~= Xmap and z+nz+nz ~= Zmap and map[x+nx+nx][y-1][z+nz+nz] ~= 2 then
			map[x+nx+nx][y+ny][z+nz+nz] = old
			old = new
			map[x][y][z] = new
			new = old
			x = x + nx
			y = y + ny
			z = z + nz
		else
			view = lastview	
		end
	elseif old == 4 then
		view = lastview
	else
	map[x][y][z] = new
	new = old
	x = x + nx
	y = y + ny
	z = z + nz
	end
	map[x][y][z] = 1
	pressed = false
	return view,x,y,z
end

function updatemap()
	for i = 1, Xmap+1 do
		for j = 1, Ymap+1 do
			for k = 1, Zmap+1 do
				if orgmap[i][j][k] == 2 then
					map[i][j][k] = orgmap[i][j][k]
				elseif orgmap[i][j][k] == 3 and i < Xmap and j < Ymap and k < Zmap then
					map[i][j][k] = 2
				elseif orgmap[i][j][k] == 4 and i < Xmap and j < Ymap and k < Zmap then
					map[i][j][k] = 2
				end
			end
		end
	end
end