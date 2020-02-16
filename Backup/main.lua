width = 10


function love.load() -- Cellen under = Höger, Samma Cell = Neråt, Cellern åt Höger = Vänster
	map = {{{1,2,2,2,2,2,2,2,2,2},{0,2,2,2,2,2,2,2,3,2},{0,2,2,2,2,2,2,2,2,2},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{2,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0}},
		{{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,2},{0,0,0,0,0,0,0,0,0,0}},
		{{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0}},
		{{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0}},
		{{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0}},
		{{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0}},
		{{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0}},
		{{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0}},
		{{0,0,0,0,0,0,0,0,2,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{2,0,0,0,0,0,0,0,0,0}},
		{{2,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,2,0},{0,0,0,0,0,0,0,0,0,0}}}
	lastkey = '1'
	view = 3
	x = 1
	y = 1
	z = 1
end

function love.update(dt)
	if view == 1 then
		if lastkey == 'w' and y ~= 1 and map[x][y-1][z] ~= 2 then
			map[x][y][z] = 0
			y = y - 1
			map[x][y][z] = 1
		elseif lastkey == 'a' and x ~= 1 and map[x-1][y][z] ~= 2 then
			map[x][y][z] = 0
			x = x - 1
			map[x][y][z] = 1
		elseif lastkey == 's' and y ~= width and map[x][y+1][z] ~= 2 then
			map[x][y][z] = 0
			y = y + 1
			map[x][y][z] = 1
		elseif lastkey == 'd' and x ~= width and map[x+1][y][z] ~= 2 then
			map[x][y][z] = 0
			x = x + 1
			map[x][y][z] = 1
		end
	elseif view == 2 then
		if lastkey == 'w' and y ~= 1 and map[x][y-1][z] ~= 2 then
			map[x][y][z] = 0
			y = y - 1
			map[x][y][z] = 1
		elseif lastkey == 'a' and z ~= 1 and map[x][y][z-1] ~= 2 then
			map[x][y][z] = 0
			z = z - 1
			map[x][y][z] = 1
		elseif lastkey == 's' and y ~= width and map[x][y+1][z] ~= 2 then
			map[x][y][z] = 0
			y = y + 1
			map[x][y][z] = 1
		elseif lastkey == 'd' and z ~= width and map[x][y][z+1] ~= 2 then
			map[x][y][z] = 0
			z = z + 1
			map[x][y][z] = 1
		end
	elseif view == 3 then
		if lastkey == 'w' and z ~= 1 and map[x][y][z-1] ~= 2 then
			map[x][y][z] = 0
			z = z - 1
			map[x][y][z] = 1
		elseif lastkey == 'a' and x ~= 1 and map[x-1][y][z] ~= 2 then
			map[x][y][z] = 0
			x = x - 1
			map[x][y][z] = 1
		elseif lastkey == 's' and z ~= width and map[x][y][z+1] ~= 2 then
			map[x][y][z] = 0
			z = z + 1
			map[x][y][z] = 1
		elseif lastkey == 'd' and x ~= width and map[x+1][y][z] ~= 2 then
			map[x][y][z] = 0
			x = x + 1
			map[x][y][z] = 1
		end
	end
	if lastkey == '1' then
			view = 1
	elseif lastkey == '2' then
			view = 2
	elseif lastkey == '3' then
			view = 3
	end
end

function love.draw(dt)
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
				end
					love.graphics.setColor(255,255,255)
					love.graphics.rectangle("line", 16*i, 172+16*k, 16, 16)

			end
		end
	end
end

function love.keypressed(key)
	lastkey = key
end

function printbg()
	for i = 1, width+1 do
		for j = 1, width+1 do
			for k = width, 0, -1 do
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
	for i = 1, width do
		for j = 1, width do
			for k = width, 1, -1 do
				if view == 1 then t = k s = z
				elseif view == 2 then t = x s = i
				elseif view == 3 then t = y s = j end
				local x1 = (i * 32) - (j * 32) + 700
				local x2 = x1 + 30
				local x3 = x1
				local x4 = x1 - 30
				local y1 = (((j * 32) + (i * 32)) / 2) + 10
				local y2 = y1 + 15
				local y3 = y1 + 30
				local y4 = y1 + 15
				if map[i][j][k] == 1 or map[i][j][k] == 2 or s == t - 1 then --or map[i][j][k] == 3  or (z < k and i < x  and j < y) then
					if map[i][j][k] == 1 then
						r,g,b,a = 255,0,0,255
					elseif map[i][j][k] == 2 then
						if s > t then
						r,g,b,a = 25,25,25,100
						else
						r,g,b,a = 25,25,25,255
						end
					elseif map[i][j][k] == 3 then
						r,g,b,a = 255,155,0,255
					else 
						--r,g,b,a = 43,198,43,200
						r,g,b,a = 255,255,255,255
					end
					
					love.graphics.setColor(r,g,b,a)
					love.graphics.polygon('fill', x1, y1+(32*k)-32, x2, y2+(32*k)-32, x3, y3+(32*k)-32, x4, y4+(32*k)-32)
					love.graphics.setColor(0,0,0)
					love.graphics.polygon('line', x1, y1+(32*k)-32, x2, y2+(32*k)-32, x3, y3+(32*k)-32, x4, y4+(32*k)-32)
				
					love.graphics.setColor(b,g,r,a)
					love.graphics.polygon('fill', x3, y3+(32*k)-32, x4, y4+(32*k)-32, x4, y4+(32*k), x3, y3+(32*k))
					love.graphics.setColor(0,0,0)
					love.graphics.polygon('line', x3, y3+(32*k)-32, x4, y4+(32*k)-32, x4, y4+(32*k), x3, y3+(32*k))
					
					love.graphics.setColor(g,r,b,a)
					love.graphics.polygon('fill', x2, y2+(32*k)-32, x3, y3+(32*k)-32, x3, y3+(32*k), x2, y2+(32*k))
					love.graphics.setColor(0,0,0)
					love.graphics.polygon('line', x2, y2+(32*k)-32, x3, y3+(32*k)-32, x3, y3+(32*k), x2, y2+(32*k))
				end
			end
		end
	end
end