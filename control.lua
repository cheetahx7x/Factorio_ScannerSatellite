function Rocket_launched(event)
    if event.rocket.get_inventory(defines.inventory.rocket).get_item_count("scanner-satellite")>=1 then
        scan(event.rocket_silo.position,event.rocket_silo.surface)
    end
end

function scan(position,surface)
    local p = position
    local r = settings.global["initial-scan-radius"].value+game.forces["player"].get_item_launched("scanner-satellite")*settings.global["consecutive-scan-radius-expansion"].value
    for chunk in surface.get_chunks() do
        if(chunk.x >= p.x-r and chunk.x <= p.x+r and chunk.y >= p.y-r and chunk.y <= p.y+r) then
            surface.request_to_generate_chunks({chunk.x,chunk.y},0)
            surface.force_generate_chunk_requests()
            game.forces["player"].chart(surface,chunk.area)
            game.print("x: "..chunk.x.."  y: "..chunk.y)
        end
    end
end

script.on_event(defines.events.on_rocket_launched,Rocket_launched)