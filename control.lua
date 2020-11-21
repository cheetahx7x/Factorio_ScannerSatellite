function Rocket_launched(event)
    local rocket = event.rocket
    local item = rocket.get_inventory(defines.inventory.rocket)
    if item.get_item_count("scanner-satellite")>=1 then
        scan(rocket.position)
    end
end

function scan(position)
    global.count = global.count or 0
    local p = position
    p.y = p.y+250
    game.print(p.x..p.y)
    game.surfaces[1].request_to_generate_chunks(p,32+global.count*10)
    game.surfaces[1].force_generate_chunk_requests()
    game.forces["player"].chart_all(1)
    global.count = global.count+1
end

script.on_event(defines.events.on_rocket_launched,Rocket_launched)
