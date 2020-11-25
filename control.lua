function Rocket_launched(event)
    if event.rocket.get_inventory(defines.inventory.rocket).get_item_count("scanner-satellite")>=1 then
        scan(event.rocket_silo.position,event.rocket_silo.surface)
    end
end

function scan(position,surface)
    local p = position
    local r = settings.global["initial-scan-radius"].value+game.forces["player"].get_item_launched("scanner-satellite")*settings.global["consecutive-scan-radius-expansion"].value
    game.forces["player"].chart(surface,{{x=p.x+r*32,y=p.y+r*32},{x=p.x-r*32,y=p.y-r*32}})
end

script.on_event(defines.events.on_rocket_launched,Rocket_launched)