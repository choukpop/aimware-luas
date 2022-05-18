-------------- Variables
local mainWidthMenu = 296
local mainWidthSplit = 312
local widthButton = mainWidthMenu - 32
local heightCustomName = 20
local heightChangeCategory = 120

local defaultColor = { 96, 0, 255, 255 }
local monitorResolutionWidth, monitorResolutionHeight = draw.GetScreenSize()

-------------- Tab
local option_reference = 'Misc'
local misc_tab_kpop = gui.Tab(gui.Reference(option_reference), 'chou', 'Kpop Features')

-------------- Change Category
local misc_main = gui.Groupbox(misc_tab_kpop, 'Change Category', 16, 16, mainWidthMenu, 0)
local change_category = { 'Disabled', 'Extra Features', 'Clantag', 'Watermark', 'Bomb Section', 'Indicators' }
local misc_change_category = gui.Combobox(misc_main, 'change.category', 'Change Category', unpack(change_category))

-------------- Menus
local misc_extra = gui.Groupbox(misc_tab_kpop, change_category[1 + 1], 16 + mainWidthSplit, 16, mainWidthMenu, 0)
local misc_clantag = gui.Groupbox(misc_tab_kpop, change_category[2 + 1], 16 + mainWidthSplit, 16, mainWidthMenu, 0)
local misc_watermark = gui.Groupbox(misc_tab_kpop, change_category[3 + 1], 16 + mainWidthSplit, 16, mainWidthMenu, 0)
local misc_bomb_circle = gui.Groupbox(misc_tab_kpop, change_category[4 + 1], 16 + mainWidthSplit, 16, mainWidthMenu, 0)
local misc_indicators = gui.Groupbox(misc_tab_kpop, change_category[5 + 1], 16 + mainWidthSplit, 16, mainWidthMenu, 0)

local luaDisabledCondition
callbacks.Register('Draw', function()
    local changeCategorySelected = misc_change_category:GetValue()

    -- Variable Global
    local luaDisabled = changeCategorySelected == 0
    luaDisabledCondition = luaDisabled == false

    local extraFeatures = changeCategorySelected == 1
    local clantag = changeCategorySelected == 2
    local watermark = changeCategorySelected == 3
    local bombSection = changeCategorySelected == 4
    local indicators = changeCategorySelected == 5

    misc_extra:SetInvisible(not extraFeatures)
    misc_clantag:SetInvisible(not clantag)
    misc_watermark:SetInvisible(not watermark)
    misc_bomb_circle:SetInvisible(not bombSection)
    misc_indicators:SetInvisible(not indicators)
end)

-------------- Extra Features
local misc_force_crosshair = gui.Checkbox(misc_extra, 'force.crosshair', 'Force Crosshair', false)
local misc_hitlog = gui.Checkbox(misc_extra, 'hitlog.nvidea', 'Hitlog Enable', false)
local misc_hitlog_skeet = gui.Checkbox(misc_extra, 'hitlog.skeet', 'Hitlog Skeet Enable', false)
local misc_onkillchams = gui.Checkbox(misc_extra, 'onkillchams', 'On Kill Chams', false)
local misc_fix_predict_grenade = gui.Checkbox(misc_extra, 'fix.predict', 'Fix Grenade Prediction', false)
local misc_radar_engine = gui.Checkbox(misc_extra, 'radar.enable', 'Radar Engine', false)

-------------- Clantag
local clantag_modes = { 'Disabled', 'Static', 'Animated', 'ChouKpop', 'Gamesense', 'NeverLose' }
local misc_clantag_mode = gui.Combobox(misc_clantag, 'clantag.mode', 'Custom Clantag Mode', unpack(clantag_modes))
local misc_clantag_speed = gui.Slider(misc_clantag, 'clantag.speed', 'Clantag Speed', 3, 1, 10, 0.2)
local misc_clantag_text = gui.Text(misc_clantag, 'Name for Clantag')
local misc_clantag_name = gui.Editbox(misc_clantag, 'clantag.text', '')
misc_clantag_name:SetHeight(heightCustomName)
local misc_unalias = gui.Button(misc_clantag, 'Remove Alias CFG', function()
	gui.Command('unalias invertrot')
	gui.Command('unalias espon')
	gui.Command('unalias espoff')
	gui.Command('unalias autodir1')
	gui.Command('unalias autodir2')
	gui.Command('unalias cls')
	gui.Command('unalias lyb')
	gui.Command('unalias micro')
	gui.Command('unalias hsbc')
	gui.Command('unalias hsbc1')
end)
misc_unalias:SetWidth(widthButton)

-------------- Watermark
local misc_watermark_enable = gui.Checkbox(misc_watermark, 'watermark.enable', 'Enable Watermark', false)
local misc_watermark_text_clr = gui.ColorPicker(misc_watermark_enable, 'watermark.text.clr', 'Watermark Text Color', 255, 255, 255, 255)
local misc_watermark_border_clr = gui.ColorPicker(misc_watermark_enable, 'watermark.border.clr', 'Watermark Border Color', defaultColor[1], defaultColor[2], defaultColor[3], defaultColor[4])
local misc_watermark_border2_clr = gui.ColorPicker(misc_watermark_enable, 'watermark.border2.clr', 'Watermark Border Color 2', defaultColor[1], defaultColor[2], defaultColor[3], defaultColor[4])
local misc_watermark_position_x = gui.Slider(misc_watermark, 'watermark.position.x', 'X Offset', 15, 0, 75)
local misc_watermark_position_y = gui.Slider(misc_watermark, 'watermark.position.y', 'Y Offset', 15, 0, 75)
local misc_watermark_position = gui.Combobox(misc_watermark, 'watermark.position', 'Watermark Position', 'Top Right', 'Top Left', 'Bottom Right', 'Bottom Left')
local misc_watermark_style = gui.Combobox(misc_watermark, 'watermark.style', 'Watermark Style', 'Skeet', 'Onetap', 'Sypher')
local misc_watermark_extra_features = gui.Multibox(misc_watermark, 'Watermark Options')
local misc_watermark_options_fps = gui.Checkbox(misc_watermark_extra_features, 'watermark.options.fps', 'FPS', false)
local misc_watermark_options_username = gui.Checkbox(misc_watermark_extra_features, 'watermark.options.username', 'Username', false)
local misc_watermark_options_ping = gui.Checkbox(misc_watermark_extra_features, 'watermark.options.ping', 'Ping', false)
local misc_watermark_options_server = gui.Checkbox(misc_watermark_extra_features, 'watermark.options.server', 'Server', false)
local misc_watermark_enable_ingame = gui.Checkbox(misc_watermark_extra_features, 'watermark.ingame', 'Ingame Check', false)
local misc_watermark_text = gui.Text(misc_watermark, 'Watermark Name')
local misc_watermark_name = gui.Editbox(misc_watermark, 'watermark.name', '')
misc_watermark_name:SetHeight(heightCustomName)

-------------- Bomb Info
local misc_bomb_enable = gui.Checkbox(misc_bomb_circle, 'bomb.circle.enable', 'C4 Indicators', false)
local misc_bomb_indicator_clr = gui.ColorPicker(misc_bomb_enable, 'bomb.circle.indicator.color', 'C4 Indicators Color', defaultColor[1], defaultColor[2], defaultColor[3], defaultColor[4])
local misc_bomb_border_clr = gui.ColorPicker(misc_bomb_circle, 'bomb.circle.border.color', 'Circle Border Color', 0, 0, 0, 20)
local misc_bomb_progress_clr = gui.ColorPicker(misc_bomb_circle, 'bomb.circle.progress.color', 'Circle Progress Color', defaultColor[1], defaultColor[2], defaultColor[3], defaultColor[4])
local misc_bomb_bombsite_clr = gui.ColorPicker(misc_bomb_circle, 'bomb.circle.bombsite.color', 'Text Bombsite Color', defaultColor[1], defaultColor[2], defaultColor[3], defaultColor[4])
local misc_bomb_defuse_progress_clr = gui.ColorPicker(misc_bomb_circle, 'bomb.circle.defuse.progress.color', 'Defuse Progress Color', 0, 255, 255, 255)
local misc_bomb_xpos = gui.Slider(misc_bomb_circle, 'bomb.circle.pos.x', 'X Position', 15, 0, monitorResolutionWidth)
local misc_bomb_ypos = gui.Slider(misc_bomb_circle, 'bomb.circle.pos.y', 'Y Position', 750, 0, monitorResolutionHeight)

-------------- Indicators
local misc_indicators_enable = gui.Checkbox(misc_indicators, 'indicators.enable', 'Enable Indicators', false)
-- local misc_indicators_position_x = gui.Slider(misc_indicators, 'indicators.position.x', 'X Offset', 15, 0, monitorResolutionWidth)
-- local misc_indicators_position_y = gui.Slider(misc_indicators, 'indicators.position.y', 'Y Offset', 850, 0, monitorResolutionHeight)

--------------------------------------------------------------------------------------------------------------------------------------------
local animationStart1, animationStart2 = draw.CreateFont('Verdana', 18, 700), draw.CreateFont('Verdana', 14, 700)
local updateframes, fadeout, spacing, fadein, up_to_date = 0, 0, 0, 0, false
local version = '1.1'

callbacks.Register('Draw', function()
    if updateframes < 5.5 then
        if up_to_date or updateframes < 0.25 then
            updateframes = updateframes + globals.AbsoluteFrameTime()
            if updateframes > 5 then
                fadeout = ((updateframes - 5) * 510)
            end

            if updateframes > 0.1 and updateframes < 0.25 then
                fadein = (updateframes - 0.1) * 4500
            end

            if fadein < 0 then fadein = 0 end
            if fadein > 650 then fadein = 650 end
            if fadeout < 0 then fadeout = 0 end
            if fadeout > 255 then fadeout = 255 end
        end

        if updateframes >= 0.25 then fadein = 650 end

        for i = 0, 600 do
            local alpha = 200 - i / 3 - fadeout
            if alpha < 0 then alpha = 0 end
            draw.Color(15, 15, 15, alpha)
            draw.FilledRect(i - 650 + fadein, 0, i + 1 - 650 + fadein, 30)
            draw.Color(120, 60, 180, alpha)
            draw.FilledRect(i - 650 + fadein, 30, i + 1 - 650 + fadein, 31)
        end

        draw.SetFont(animationStart1)
        draw.Color(120, 60, 180, 255 - fadeout)
        draw.Text(7 - 650 + fadein, 7, 'Shy')
        draw.Color(225, 225, 225, 255 - fadeout)
        draw.Text(7 + draw.GetTextSize('Shy') - 650 + fadein, 7, 'Kpop')
        draw.Color(120, 60, 180, 255 - fadeout)
        draw.Text(7 + draw.GetTextSize('ShyKpop  ') - 650 + fadein, 7, '|')
        spacing = draw.GetTextSize('ShyKpop  |  ')
        draw.SetFont(animationStart2)
        draw.Color(225, 225, 225, 255 - fadeout)

        up_to_date = true
    end

    if up_to_date and updateframes < 5.5 then
        draw.Text(7 + spacing - 650 + fadein, 9, 'Successfully loaded latest version: v' .. version)
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------
-------------- Skybox
local skyboxesMenu = { 'Default', 'Tibet',    'Embassy', 'Italy', 'Jungle', 'Office', 'CS15 Daylight HDR',       'Cloudy 1',          'Night 2',          'Night 2B',          'Day 2 5 HDR',      'Day 2 5',      'Dust',     'Vertigo HDR', 'Vertigoblue HDR', 'Vertigo', 'Vietnam', 'Space 1', 'Space 2', 'Space 3', 'Space 4', 'Space 5', 'Space 6', 'Space 7', 'Space 8', 'Space 9', 'Space 10', 'Space 11', 'Space 12', 'Space 13', 'Space 14', 'Space 15', 'Space 16',  'Space 17', 'Space 18',    'Space 19', 'Space 20', 'Space 21', 'Space 22', 'Space 23', 'Space 24', 'Space 25', 'Space 26', 'Space 27', 'Space 28', 'Space 29', 'Space 30', 'Space 31', 'Space 32', 'Space 33', 'Space 34', 'Space 35', 'Space 36', 'Space 37', 'Space 38', 'Space 39', 'Space 40', 'Space 41', 'Space 42', 'Space 43', 'Space 44', 'Space 45', 'Space 46', 'Space 47', 'Space 48' }
local skyboxes = {     'Default', 'cs_tibet', 'embassy', 'italy', 'jungle', 'office', 'sky_cs15_daylight01_hdr', 'sky_csgo_cloudy01', 'sky_csgo_night02', 'sky_csgo_night02b', 'sky_day02_05_hdr', 'sky_day02_05', 'sky_dust', 'vertigo_hdr', 'vertigoblue_hdr', 'vertigo', 'vietnam', 'mr_01',   'mr_02',   'mr_03',   'mr_04',   'mr_05',   'mr_06',   'mr_07',   'mr_08',   'mr_10',   'mr_12',    'mr_13',    'mr_15',    'mr_16',    'mr_ice',   'mr_moon',  'mr_night_', 'mr1',      'sky_descent', 'sky_l',    'sky_z',    'sky1',     'sky174',   'sky175',   'sky176',   'sky177',   'sky178',   'sky179',   'sky180',   'sky181',   'sky182',   'sky183',   'sky184',   'sky185',   'sky186',   'sky187',   'sky191',   'sky192',   'space_1',  'space_3',  'space_4',  'space_5',  'space_6',  'space_7',  'space_8',  'space_9',  'space_10', 'space_22', 'space_23' }

local menuSkyboxReference = gui.Reference('Visuals', 'World', 'Materials', 'Skybox')
menuSkyboxReference:SetOptions(unpack(skyboxesMenu))

local last = menuSkyboxReference:GetValue()
callbacks.Register('Draw', function()
    if last ~= menuSkyboxReference:GetValue() then
        client.SetConVar('sv_skyname' , skyboxes[menuSkyboxReference:GetValue() + 1], true)
        last = menuSkyboxReference:GetValue()
    end
end)

-------------- Force Crosshair
callbacks.Register('Draw', function()
    if misc_force_crosshair:GetValue() and luaDisabledCondition then
        if entities.GetLocalPlayer() == nil then
            return
        end
    
        if entities.GetLocalPlayer():GetPropBool('m_bIsScoped') then
            client.SetConVar('weapon_debug_spread_show', 0, true)
        else
            client.SetConVar('weapon_debug_spread_show', 3, true)
        end
    else
        client.SetConVar('weapon_debug_spread_show', 0, true)
    end
end)

-------------- Hitlog Nvidea
local activeHitLogs = {}
local fontNvidea = draw.CreateFont('Arial', 14, 14)

function HitGroup(INT_HITGROUP)
    if misc_hitlog:GetValue() and luaDisabledCondition then
        if INT_HITGROUP == nil then
            return
        elseif INT_HITGROUP == 0 then
            return 'body'
        elseif INT_HITGROUP == 1 then
            return 'head'
        elseif INT_HITGROUP == 2 then
            return 'chest'
        elseif INT_HITGROUP == 3 then
            return 'stomach'
        elseif INT_HITGROUP == 4 then
            return 'left arm'
        elseif INT_HITGROUP == 5 then
            return 'right arm'
        elseif INT_HITGROUP == 6 then
            return 'left leg'
        elseif INT_HITGROUP == 7 then
            return 'right leg'
        elseif INT_HITGROUP == 10 then
            return 'body'
        end
    end
end

function addLog(time, ...)
    table.insert(activeHitLogs, {
        ['text'] = { ... },
        ['time'] = time,
        ['delay'] = globals.RealTime() + time,
        ['color'] = {{150, 185, 1}, {16, 0, 0}},
        ['x_pad'] = -11,
        ['x_pad_b'] = -11,
    })
end

function getMultiColorTextSize(lines)
    local fw = 0
    local fh = 0
    for i = 1, #lines do
        draw.SetFont(fontNvidea)
        local w, h = draw.GetTextSize(lines[i][4])
        fw = fw + w
        fh = h
    end
    return fw, fh
end

function drawMultiColorText(x, y, lines)
    local x_pad = 0
    for i = 1, #lines do
        local line = lines[i]
        local r, g, b, msg = line[1], line[2], line[3], line[4]
        draw.SetFont(fontNvidea)
        draw.Color(r, g, b, 255)
        draw.Text(x + x_pad, y, msg)
        local w, _ = draw.GetTextSize(msg)
        x_pad = x_pad + w
    end
end

function showLog(count, color, text, layer)
    local y = 40 + (42 * (count - 1));
    local w, h = getMultiColorTextSize(text)
    local mw = w < 150 and 150 or w
    if globals.RealTime() < layer.delay then
        if layer.x_pad < mw then layer.x_pad = layer.x_pad + (mw - layer.x_pad) * 0.05 end
        if layer.x_pad > mw then layer.x_pad = mw end
        if layer.x_pad > mw / 1.09 then
            if layer.x_pad_b < mw - 6 then
                layer.x_pad_b = layer.x_pad_b + ((mw - 6) - layer.x_pad_b) * 0.05
            end
        end
        if layer.x_pad_b > mw - 6 then
            layer.x_pad_b = mw - 6
        end
    else
        if layer.x_pad_b > -11 then
            layer.x_pad_b = layer.x_pad_b - (((mw - 5) - layer.x_pad_b) * 0.05) + 0.01
        end
        if layer.x_pad_b < (mw - 11) and layer.x_pad >= 0 then
            layer.x_pad = layer.x_pad - (((mw + 1) - layer.x_pad) * 0.05) + 0.01
        end
        if layer.x_pad < 0 then
            table.remove(activeHitLogs, count)
        end
    end
    local c1 = color[1]
    local c2 = color[2]
    local a = 255;
    draw.Color(c1[1], c1[2], c1[3], a);
    draw.FilledRect(layer.x_pad - layer.x_pad, y, layer.x_pad + 28, (h + y) + 20);
    draw.Color(c2[1], c2[2], c2[3], a);
    draw.FilledRect(layer.x_pad_b - layer.x_pad, y, layer.x_pad_b + 22, (h + y) + 20);
    drawMultiColorText(layer.x_pad_b - mw + 18, y + 9, text)
end

callbacks.Register('FireGameEvent', function(e)
    if misc_hitlog:GetValue() and luaDisabledCondition then
        local isHurt = e:GetName() == 'player_hurt'
        local weaponFired = e:GetName() == 'weapon_fire'

        if isHurt == false and weaponFired == false then
            return
        end

        local localPlayer = entities.GetLocalPlayer()
        local user = entities.GetByUserID(e:GetInt('userid'))
        if localPlayer == nil or user == nil then
            return
        end
        if isHurt then
            local attacker = entities.GetByUserID(e:GetInt('attacker'))
            local remainingHealth = e:GetInt('health')
            local damageDone = e:GetInt('dmg_health')
            if attacker == nil then
                return
            end
            if (localPlayer:GetIndex() == attacker:GetIndex()) then
                addLog(5,
                    { 255, 255, 255, 'Hit ' },
                    { 150, 185, 1, string.sub(user:GetName(), 0, 28) },
                    { 255, 255, 255, ' in the ' },
                    { 150, 185, 1, HitGroup(e:GetInt('hitgroup')) },
                    { 255, 255, 255, ' for ' },
                    { 150, 185, 1, damageDone },
                    { 255, 255, 255, ' damage (' },
                    { 150, 185, 1, remainingHealth .. ' health remaining' },
                    { 255, 255, 255, ')' })
            end
        elseif weaponFired then
            if localPlayer:GetIndex() == user:GetIndex() and target ~= nil then
                -- todo implement miss shots
            end
        end
    end
end)

callbacks.Register('Draw', function()
    if misc_hitlog:GetValue() and luaDisabledCondition then
        for index, hitlog in pairs(activeHitLogs) do
            showLog(index, hitlog.color, hitlog.text, hitlog)
        end
    end
end)

-------------- Hitlog Skeet
local fontGamesenseHitlog = draw.CreateFont('Verdana', 13, 500)
local hit_logs = {}
local hitgroup_names = {'head', 'chest', 'stomach', 'left arm', 'right arm', 'left leg', 'right leg'}

callbacks.Register('FireGameEvent', function(e)
    if luaDisabledCondition and not misc_hitlog_skeet:GetValue() or e:GetName() ~= 'player_hurt' then
        return
    end

    if client.GetPlayerIndexByUserID(e:GetInt('userid')) ~= client.GetLocalPlayerIndex() and client.GetPlayerIndexByUserID(e:GetInt('attacker')) == client.GetLocalPlayerIndex() then
        log = string.format('Hit %s in the %s for %s damage (%s health remaining)',
            client.GetPlayerNameByUserID(e:GetInt('userid')),
            hitgroup_names[e:GetInt('hitgroup')] or 'body',
            e:GetString('dmg_health'),
            e:GetString('health'))

        hit_logs[#hit_logs + 1] = {globals.CurTime(), log}
    end
end)

callbacks.Register('Draw', function()
    if luaDisabledCondition and not misc_hitlog_skeet:GetValue() or hit_logs[1] == nil then
        return
    end

    local ScreenY = 40

    if luaDisabledCondition then
        local alpha1
        for k, v in pairs(hit_logs) do
            alpha = (v[1] - globals.CurTime() + 12) / 12

            if 255 * alpha > 67.5 then
                draw.SetFont(fontGamesenseHitlog)
                local tW, tH = draw.GetTextSize(v[2])
                draw.Color(255, 255, 255, 255 * alpha)
                draw.TextShadow(10, ScreenY, v[2])
                ScreenY = ScreenY + tH + 8
            else
                table.remove(hit_logs, k)
            end
        end
    else
        alpha = 0
        table.remove(hit_logs, k)
    end
end)

-------------- On Kill Chams
callbacks.Register('Draw', function()
    if misc_onkillchams:GetValue() and luaDisabledCondition then
        gui.SetValue('esp.other.norenderdead', 0)
    end
    
    local enableCondition = misc_onkillchams:GetValue() and luaDisabledCondition
    client.SetConVar('cl_ragdoll_physics_enable', enableCondition and 0 or 1 or 2, true)
end)

-------------- Fix Grenade Predict
callbacks.Register('Draw', function()
    if misc_fix_predict_grenade:GetValue() and luaDisabledCondition and entities.GetLocalPlayer() then
        if input.IsButtonDown(1) or input.IsButtonDown(2) then
            gui.SetValue('esp.world.nadetracer.local', 1)
        else
            gui.SetValue('esp.world.nadetracer.local', 0)
        end
    end
end)

-------------- Radar Engine
local radar_cache = false
callbacks.Register('Draw', function()
    if misc_radar_engine:GetValue() and luaDisabledCondition then
        for index, Player in pairs(entities.FindByClass("CCSPlayer")) do
            Player:SetProp("m_bSpotted", 1)
        end
        radar_cache = true
    else
        radar_cache = false
    end

end)

--------------------------------------------------------------------------------------------------------------------------------------------
-------------- Clantag Changer
local choukpopTag = {
    '              ',
    '             c',
    '            ch',
    '           cho',
    '          chou',
    '         chouk',
    '        choukp',
    '       choukpo',
    '      choukpop',
    '     choukpop ',
    '    choukpop  ',
    '   choukpop   ',
    '  choukpop    ',
    ' choukpop     ',
    'choukpop      ',
    'houkpop       ',
    'oukpop        ',
    'ukpop         ',
    'kpop          ',
    'pop           ',
    'op            ',
    'p             ',
    '              '
}

local gamesenseTag = {
    '                  ',
    '                 g',
    '                ga',
    '               gam',
    '              game',
    '             games',
    '            gamese',
    '           gamesen',
    '          gamesens',
    '         gamesense',
    '        gamesense ',
    '       gamesense  ',
    '      gamesense   ',
    '     gamesense    ',
    '    gamesense     ',
    '   gamesense      ',
    '  gamesense       ',
    ' gamesense        ',
    'gamesense         ',
    'amesense          ',
    'mesense           ',
    'esense            ',
    'sense             ',
    'sens              ',
    'sen               ',
    'se                ',
    's                 '
}

local neverloseTag = {
    ' ',
    ' |',
    ' ',
    'N ',
    'N ',
    'N3 ',
    'Ne ',
    'Ne\\ ',
    'Ne\\/ ',
    'Nev ',
    'Nev3 ',
    'Neve ',
    'Neve| ',
    'Neve|2 ',
    'Never| ',
    'Never|_ ',
    'Neverl ',
    'Neverl0 ',
    'Neverlo ',
    'Neverlo5 ',
    'Neverlos ',
    'Neverlos3 ',
    'Neverlose ',
    'Neverlose. ',
    'Neverlose.< ',
    'Neverlose.c< ',
    'Neverlose.cc ',
    'Neverlose.cc ',
    'Neverlose.c< ',
    'Neverlose.< ',
    'Neverlose. ',
    'Neverlose ',
    'Neverlos3 ',
    'Neverlos ',
    'Neverlo_ ',
    'Neverlo5 ',
    'Neverlo ',
    'Neverl_ ',
    'Never|0 ',
    'Never| ',
    'Neve|2 ',
    'Neve| ',
    'Neve ',
    'Nev3 ',
    'Nev ',
    'Ne\\/ ',
    'Ne\\ ',
    'Ne ',
    'N3 ',
    'N ',
    '|\\| ',
    ' ',
    ' |',
    ' ',
    ' ',
    ' '
}

local _SetTag = ffi.cast('int(__fastcall*)(const char*, const char*)', mem.FindPattern('engine.dll', '53 56 57 8B DA 8B F9 FF 15'))
local last = nil
local SetTag = function(customtag)
    if customtag ~= last then
        _SetTag(customtag, '')
        last = customtag
    end
end

local tag = ' '
local lasttag = nil
local tagsteps = {}
function makesteps()
    tagsteps = {' '}
  
    for i = 1, #tag do
        table.insert(tagsteps, tag:sub(1, i))
    end
  
    for i = #tagsteps - 1, 1, -1 do
        table.insert(tagsteps, tagsteps[i])
    end
end
  
callbacks.Register('Draw', function()
    if misc_clantag_mode:GetValue() ~= 0 and luaDisabledCondition then
        gui.SetValue('misc.clantag', false)

        if misc_clantag_mode:GetValue() == 1 then
            SetTag(misc_clantag_name:GetValue())

            enableClanTagOptions()
        elseif misc_clantag_mode:GetValue() == 2 then
            tag = misc_clantag_name:GetValue()
            if lasttag ~= tag then
                makesteps()
                lasttag = tag
            end

            SetTag(tagsteps[math.floor((globals.CurTime() * misc_clantag_speed:GetValue())) % (#tagsteps - 1) + 1])

            enableClanTagOptions()
        elseif misc_clantag_mode:GetValue() == 3 then
            local curtime = math.floor(globals.CurTime() * 2.3)
            if old_time ~= curtime then
                SetTag(choukpopTag[curtime % #choukpopTag + 1])
            end
            old_time = curtime

            disableClanTagOptions()
        elseif misc_clantag_mode:GetValue() == 4 then
            local curtime = math.floor((globals.CurTime() * 2.4) % 27)
            if old_time ~= curtime then
                SetTag(gamesenseTag[curtime % #gamesenseTag + 1])
            end
            old_time = curtime

            disableClanTagOptions()
        elseif misc_clantag_mode:GetValue() == 5 then
            -- local curtime = math.floor(globals.CurTime() % 56)
            local curtime = math.floor((globals.CurTime() * 2.4))
            print(curtime)
            if old_time ~= curtime then
                SetTag(neverloseTag[curtime % #neverloseTag + 1])
            end
            old_time = curtime

            disableClanTagOptions()
        end
    else
        SetTag('')
        disableClanTagOptions()
    end
end)

function disableClanTagOptions()
    misc_clantag_speed:SetDisabled(true)
    misc_clantag_text:SetDisabled(true)
    misc_clantag_name:SetDisabled(true)
end

function enableClanTagOptions()
    misc_clantag_speed:SetDisabled(false)
    misc_clantag_text:SetDisabled(false)
    misc_clantag_name:SetDisabled(false)
end

callbacks.Register('Unload', function()
    SetTag('')
end)

--------------------------------------------------------------------------------------------------------------------------------------------
-------------- Watermark
local fontSkeetWatermark = draw.CreateFont('Verdana', 18, 500)
local scrW, scrH = 0, 0
local initialize = false
local mouseX, mouseY = 0, 0
local localplayer, playerResources, fps
local username, ping, server = '', '', ''

function drawFilledRect(r, g, b, a, x, y, width, height)
	draw.Color(r, g, b, a)
	draw.FilledRect(x, y, x + width, y + height)
end

function drawCenteredText(r, g, b, a, x, y, font, str)
	draw.Color(r, g, b, a)
	draw.SetFont(font)
	local textW, textH = draw.GetTextSize(str)
	draw.Text(x - (textW / 2), y - (textH / 2), str)
end

function drawGradient(color1, color2, x, y, w, h, vertical)
	local r2, g2, b2 = color1[1], color1[2], color1[3]
	local r, g, b = color2[1], color2[2], color2[3]
	
    drawFilledRect(r2, g2, b2, 255, x, y, w, h)
    
    if vertical then
        for i = 1, h do
            local a = i / h * 255
            drawFilledRect( r, g, b, a, x, y + i, w, 1)
        end
    else
        for i = 1, w do
            local a = i / w * 255
            drawFilledRect( r, g, b, a, x + i, y, 1, h)
        end
    end
end

function drawOutlineGradient(outlineColor, color1, color2, x, y, w, h, vertical, thickness)
	local r, g, b, a = outlineColor[1], outlineColor[2], outlineColor[3], outlineColor[4]
    
	drawFilledRect(r, g, b, a, x, y, w, h)
	drawGradient(color1, color2, x + thickness, y + thickness, w - (thickness * 2), h - (thickness * 2), vertical)
end

function drawTopWatermark()
	if misc_watermark_enable_ingame:GetValue() == true and localPlayer == nil then
		return
	end
    
	local hudPosition = misc_watermark_position:GetValue()
	local hudStyle = misc_watermark_style:GetValue()
	local x, y = 0, 0
	local r, g, b, a = misc_watermark_text_clr:GetValue()
	local borderR, borderG, borderB, borderA = misc_watermark_border_clr:GetValue()
	local border2R, border2G, border2B, border2A = misc_watermark_border2_clr:GetValue()
	local hudString = ''
    
    if misc_watermark_name:GetValue() == '' then
        hudString = 'aimware'
    else
        hudString = misc_watermark_name:GetValue()
    end
    
	local hudText = ' | '
    
	if misc_watermark_options_username:GetValue() == true or misc_watermark_options_ping:GetValue() == true or misc_watermark_options_server:GetValue() == true or misc_watermark_options_fps:GetValue() == true then
		if misc_watermark_name:GetValue() == '' then
            hudString = 'aimware'
        else
            hudString = misc_watermark_name:GetValue()
        end
	end
    
	if misc_watermark_options_username:GetValue() == true then
        if username ~= '' then
            hudString = hudString.. hudText .. username
        end
	end
    
	if misc_watermark_options_ping:GetValue() == true then
        if ping ~= '' then
            hudString = hudString.. hudText .. ping
        end
	end
    
	if misc_watermark_options_server:GetValue() == true then
        if server ~= '' then
            hudString = hudString.. hudText .. server
        end
	end
    
    if misc_watermark_options_fps:GetValue() == true then
        if fps ~= '' then
            hudString = hudString .. hudText .. fps
		end
	end
    
	draw.Color(r, g, b, a)
	draw.SetFont(fontSkeetWatermark)
	local textW, textH = draw.GetTextSize(hudString)
	local hudW, hudH = 0, 0
	
	if hudStyle == 0 then
		hudW, hudH = textW + 20, textH + 10
	elseif hudStyle == 1 then
		hudW, hudH = textW + 20, textH + 18
	else
		hudW, hudH = textW + 14, textH + 8
	end
    
	-- Set HUD Position
	if hudPosition == 0 then	
		y = y + misc_watermark_position_y:GetValue()
		x = scrW - (misc_watermark_position_x:GetValue() + hudW)
	elseif hudPosition == 1 then
		y = y + misc_watermark_position_y:GetValue()
		x = misc_watermark_position_x:GetValue()
    elseif hudPosition == 2 then
		y = ((scrH - hudH) - misc_watermark_position_y:GetValue() - 15)
		x = scrW - (misc_watermark_position_x:GetValue() + hudW)
	elseif hudPosition == 3 then
		y = ((scrH - hudH) - misc_watermark_position_y:GetValue() - 15)
		x = misc_watermark_position_x:GetValue()
	end
    
	-- Draw the HUD
    if hudStyle == 0 then
        drawFilledRect(10, 10, 10, 255, x, y, hudW, hudH + 16)
		drawFilledRect(60, 60, 60, 255, x + 1, y + 1, hudW - 2, hudH + 14)
		drawFilledRect(40, 40, 40, 255, x + 2, y + 2, hudW - 4, hudH + 12)
		drawFilledRect(17, 17, 17, 255, x + 6, y + 6, hudW - 12, hudH + 4)
		drawCenteredText(r, g, b, a, x + (hudW / 2), (y + (hudH / 2)) + 7, fontSkeetWatermark, hudString)
    elseif hudStyle == 1 then
        drawGradient({border2R, border2G, border2B, border2A}, {borderR, borderG, borderB, borderA}, x, y, hudW / 2, 2)
		drawGradient({borderR, borderG, borderB, borderA}, {border2R, border2G, border2B, border2A}, x + (hudW / 2), y, hudW / 2, 2)
		drawFilledRect(10, 10, 10, 125, x, y + 2, hudW, hudH - 2)
		drawCenteredText(r, g, b, a, x + (hudW / 2), (y + 1) + ((hudH - 2) / 2), fontSkeetWatermark, hudString)
	else
		drawFilledRect(borderR, borderG, borderB, borderA, x, y, hudW, 2)
		drawFilledRect(50, 50, 50, 185, x, y + 2, hudW, hudH - 2)
		drawCenteredText(r, g, b, a, x + (hudW / 2), (y + 1) + ((hudH - 2) / 2), fontSkeetWatermark, hudString)
	end
end

local frame_rate = 0.0
local get_abs_fps = function() 
    frame_rate = 0.9 * frame_rate + (1.0 - 0.9) * globals.AbsoluteFrameTime()
    return math.floor((1.0 / frame_rate) + 0.5)
end

callbacks.Register('Draw', function()
	if initialize == false then
		initialize = true
		scrW, scrH = draw.GetScreenSize()
	end
	
	mouseX, mouseY = input.GetMousePos()
	localPlayer = entities.GetLocalPlayer()
	playerResources = entities.GetPlayerResources()
	
	if misc_watermark_enable:GetValue() == true then
        fps = 'fps ' .. get_abs_fps()
        
		if localPlayer ~= nil then        
            username = client.GetPlayerNameByIndex(client.GetLocalPlayerIndex())
		    ping = playerResources:GetPropInt('m_iPing', localPlayer:GetIndex()) .. ' ms'
			
			if engine.GetServerIP() == 'loopback' then
				server = 'localhost'
			elseif string.find(engine.GetServerIP(), 'A') then
				server = 'valve'
			else
				server = engine.GetServerIP()
			end
		else
			ping = ''
			server = ''
            username = ''
		end
    else
        fps = ''
	end
end)

callbacks.Register('Draw', function()
	if misc_watermark_enable:GetValue() and luaDisabledCondition then
		drawTopWatermark()
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------
-------------- Bomb Info
local fontBomb = draw.CreateFont('Verdana', 32, 700)
local obj = {}
Indicator = {text = '', color = {255, 255, 255, 255}, visible = true, drawCircle = false, circleP = 0, circleT = 1, circleR = 1, circleX = 0, circleY = 0}

i = 0
function Indicator:New(text, color, visible)
	i = i + 1
	obj[i] = {}
	setmetatable(obj[i], self)
	self.__index = self
	self.text = text or ''
	self.color = color or {255, 255, 255, 255}
	self.visible = visible

	return obj[i]
end

function Indicator:Add(text, color, visible)
	local a = Indicator:New(text, color, visible)
	a:SetText(text)
	a:SetColor(color)
	a:SetVisible(visible)
	return a
end

function Indicator:SetText(text)
	self.text = text
end

function Indicator:SetColor(color)
	self.color = color
end

function Indicator:SetVisible(vis)
	self.visible = vis
end

function Indicator:SetDrawCircle(drawCircle)
	self.drawCircle = drawCircle
end

function Indicator:DrawCircle(x, y, radius, thickness, percentage)
	self.drawCircle = true
	self.circleX = x
	self.circleY = y
	self.circleR = radius
	self.circleT = thickness
	self.circleP = percentage
end

local bomb_2 = Indicator:Add('', {misc_bomb_progress_clr:GetValue()}, false)
local bomb_1 = Indicator:Add('', {misc_bomb_indicator_clr:GetValue()}, false)

local bomb = {
    display = false,
    planting = false,
    defusing = false,
    plantTime = 0,
    plantStarted = 0,
    bombsite = ''
}

local indicators = {
    bomb_2, bomb_1
}

callbacks.Register('Draw', function()
    if misc_bomb_enable:GetValue() and luaDisabledCondition then
        local pLocal = entities.GetLocalPlayer()
        -- if not pLocal then return end
        -- if not pLocal:IsAlive() then return end

        local temp = {}

        local positionY = misc_bomb_ypos:GetValue()
        local positionX = misc_bomb_xpos:GetValue()

        draw.SetFont(fontBomb)

        for i = 1, #obj do
            if obj[i].visible then
                table.insert(temp, obj[i])
            end
        end

        for i = 1, #temp do
            local __ind = temp[i]
            if __ind.visible then
                draw.Color(28, 28, 28, 50)
                draw.Color(unpack(__ind.color))
                draw.Text(positionX, positionY, __ind.text)
                if __ind.drawCircle then
                    if bomb.defusing == true then
                        for i = 0, 360 / 100 * __ind.circleP do
                            local angle = i * math.pi / 180
                            draw.Color(misc_bomb_defuse_progress_clr:GetValue())
                            local ptx, pty = __ind.circleX + __ind.circleR * math.cos(angle), positionY + __ind.circleY + __ind.circleR * math.sin(angle)
                            local ptx_, pty_ = __ind.circleX + (__ind.circleR-__ind.circleT) * math.cos(angle), positionY+ __ind.circleY + (__ind.circleR-__ind.circleT) * math.sin(angle)
                            draw.Line(ptx, pty, ptx_, pty_)
                        end
                    else
                        for i = 0, 360 / 100 * __ind.circleP do
                            local angle = i * math.pi / 180
                            draw.Color(misc_bomb_progress_clr:GetValue())
                            local ptx, pty = __ind.circleX + __ind.circleR * math.cos(angle), positionY + __ind.circleY + __ind.circleR * math.sin(angle)
                            local ptx_, pty_ = __ind.circleX + (__ind.circleR-__ind.circleT) * math.cos(angle), positionY+ __ind.circleY + (__ind.circleR-__ind.circleT) * math.sin(angle)
                            draw.Line(ptx, pty, ptx_, pty_)
                        end
                    end

                    for i = 360 / 100 * __ind.circleP + 1, 360 do
                        local angle = i * math.pi / 180
                        draw.Color(misc_bomb_border_clr:GetValue())
                        local ptx, pty = __ind.circleX + __ind.circleR * math.cos(angle), positionY + __ind.circleY + __ind.circleR * math.sin(angle)
                        local ptx_, pty_ = __ind.circleX + (__ind.circleR-__ind.circleT) * math.cos(angle), positionY + __ind.circleY + (__ind.circleR-__ind.circleT) * math.sin(angle)
                        draw.Line(ptx, pty, ptx_, pty_)
                    end
                end
                positionY = positionY - 30
            end
        end
    end
end)


function lerp_pos(x1, y1, z1, x2, y2, z2, percentage) 
	local x = (x2 - x1) * percentage + x1 
	local y = (y2 - y1) * percentage + y1
	local z = (z2 - z1) * percentage + z1
	return x, y, z 
end

function calcSite(site)
	local avec = entities.GetPlayerResources():GetProp('m_bombsiteCenterA')
	local bvec = entities.GetPlayerResources():GetProp('m_bombsiteCenterB')
	local sitevec1 = site:GetMins()
	local sitevec2 = site:GetMaxs()
	local site_x, site_y, site_z = lerp_pos(sitevec1.x, sitevec1.y, sitevec1.z , sitevec2.x, sitevec2.y, sitevec2.z, 0.5)
	local distance_a, distance_b = vector.Distance({site_x, site_y, site_z}, {avec.x, avec.y, avec.z}), vector.Distance({site_x, site_y, site_z}, {bvec.x, bvec.y, bvec.z})
	return distance_b > distance_a and 'A' or 'B'
end

function BombDamageCircle(Bomb, Player)
    if misc_bomb_enable:GetValue() and luaDisabledCondition then
        local playerOrigin = Player:GetAbsOrigin()
        local bombOrigin = Bomb:GetAbsOrigin()

        local C4Distance = math.sqrt((bombOrigin.x - playerOrigin.x) ^ 2 + 
        (bombOrigin.y - playerOrigin.y) ^ 2 + 
        (bombOrigin.z - playerOrigin.z) ^ 2)

        local Gauss = (C4Distance - 75.68) / 789.2 
        local flDamage = 450.7 * math.exp(-Gauss * Gauss)

            if Player:GetProp('m_ArmorValue') > 0 then
                local flArmorRatio = 0.5
                local flArmorBonus = 0.5

                if Player:GetProp('m_ArmorValue') > 0 then
                    local flNew = flDamage * flArmorRatio
                    local flArmor = (flDamage - flNew) * flArmorBonus
                
                    if flArmor > Player:GetProp('m_ArmorValue') then
                        flArmor = Player:GetProp('m_ArmorValue') * (1 / flArmorBonus)
                        flNew = flDamage - flArmor
                    end
                flDamage = flNew
                end
            end 
        return math.max(flDamage, 0)
    end
end


callbacks.Register('Draw', function()
    if misc_bomb_enable:GetValue() and luaDisabledCondition then
        local positionX = misc_bomb_xpos:GetValue()

        for i = 1, #indicators do
            indicators[i]:SetVisible(false)
            indicators[i]:SetDrawCircle(false)
        end
        
        
        if misc_bomb_enable:GetValue() and luaDisabledCondition then
            if bomb.display then
                if bomb.planting then
                    local PlantMath = (globals.CurTime() - bomb.plantStarted) / 3.125
                    if PlantMath < 1 then
                        bomb_1:SetVisible(true)
                        bomb_1:SetColor({misc_bomb_indicator_clr:GetValue()})
                        bomb_1:SetText('Bombsite ' .. bomb.bombsite)
                        local percentage = 100 * PlantMath
                        bomb_1:DrawCircle(positionX + 190, 12, 12, 5, percentage)
                    end
                end

                if entities.FindByClass('CPlantedC4')[1] ~= nil then
                    local Bomb = entities.FindByClass('CPlantedC4')[1]
                    local Player = entities.GetLocalPlayer()
                    if Bomb:GetProp('m_bBombTicking') and Bomb:GetProp('m_bBombDefused') == 0 and globals.CurTime() < Bomb:GetProp('m_flC4Blow') then
                        local Player = entities.GetLocalPlayer()
                        local bombtimer = math.floor((bomb.plantTime - globals.CurTime() + Bomb:GetProp('m_flTimerLength')) * 10) / 10
                        if bombtimer < 0 then
                            bombtimer = 0.0
                            bomb.defusing = false
                        end
                        if bomb.defusing == true then
                            local BombMath = ((globals.CurTime() - Bomb:GetProp('m_flDefuseCountDown')) * (0 - 1)) / ((Bomb:GetProp('m_flDefuseCountDown') - Bomb:GetProp('m_flDefuseLength')) - Bomb:GetProp('m_flDefuseCountDown')) + 1
                            bombtimer = tostring(bombtimer)
                            if not string.find(bombtimer, '%.') then
                                bombtimer = bombtimer .. '.0'
                            end
        
                            local defusetime = math.floor((Bomb:GetProp('m_flDefuseCountDown') - globals.CurTime()) * 10) / 10
                            local idk = ( Bomb:GetProp('m_flDefuseCountDown') - globals.CurTime() ) / Bomb:GetProp('m_flDefuseLength')
                            local percentage = 100 * idk
                            defusetime = tostring(defusetime)
                            if not string.find(defusetime, '%.') then
                                defusetime = defusetime .. '.0'
                            end
                            bomb_1:SetVisible(true)
                            bomb_1:SetColor({misc_bomb_bombsite_clr:GetValue()})
                            bomb_1:SetText('Bombsite ' .. bomb.bombsite)
                            bomb_1:DrawCircle(positionX + 190, 14, 14, 5, percentage)
                        else
                            local BombMath = ((globals.CurTime() - Bomb:GetProp('m_flC4Blow')) * (0 - 1)) / ((Bomb:GetProp('m_flC4Blow') - Bomb:GetProp('m_flTimerLength')) - Bomb:GetProp('m_flC4Blow')) + 1
        
                            bombtimer = tostring(bombtimer)
                            if not string.find(bombtimer, '%.') then
                                bombtimer = bombtimer .. '.0'
                            end
        
                            bomb_2:SetColor({misc_bomb_bombsite_clr:GetValue()})
                            bomb_2:SetText(bomb.bombsite .. ' - ' .. bombtimer)
                            bomb_2:SetVisible(true)
                        end
                    end
        
                    if Player:IsAlive() and globals.CurTime() < Bomb:GetProp('m_flC4Blow') and not bomb.defusing then
                        local hpleft = math.floor(0.5 + BombDamageCircle(Bomb, Player))
        
                        if hpleft >= Player:GetHealth() then
                            bomb_1:SetColor({240, 20, 0, 255})
                            bomb_1:SetText('FATAL')
                            bomb_1:SetVisible(true)
                        elseif hpleft <= 0 then
                        else
                            bomb_1:SetText('-' .. hpleft .. ' HP')
                            bomb_1:SetVisible(true)
                        end
                    end
                elseif Bomb ~= nil then
                    if Bomb:GetProp('m_bBombTicking') and Bomb:GetProp('m_bBombDefused') == 0 and globals.CurTime() < (Bomb:GetProp('m_flC4Blow') + 2) then
                        local Player = entities.GetLocalPlayer()
        
                        if Player:IsAlive() and globals.CurTime() < (Bomb:GetProp('m_flC4Blow') + 1) and not bomb.defusing then
                            local hpleft = math.floor(0.5 + BombDamageCircle(Bomb, Player))
        
                            if hpleft >= Player:GetHealth() then
                                bomb_2:SetColor({240, 20, 0, 255})
                                bomb_2:SetText('FATAL')
                                bomb_2:SetVisible(true)
                            elseif hpleft <= 0 then
                            else
                                bomb_2:SetText('-' .. hpleft .. ' HP')
                                bomb_2:SetVisible(true)
                            end
                        end
                    end
                end
            end
        end
    end
end)

callbacks.Register('FireGameEvent', function(e)
    if misc_bomb_enable:GetValue() and luaDisabledCondition then
        if e:GetName() == 'bomb_beginplant' then
            bomb.display = true
            bomb.plantStarted = globals.CurTime() 
            bomb.bombsite = calcSite(entities.GetByIndex(e:GetInt('site')))
            bomb.planting = true 
        end
        
        if e:GetName() == 'bomb_abortplant' then 
            bomb.planting = false
        end

        if e:GetName() == 'bomb_begindefuse' then
            bomb.display = true
            bomb.defusing = true
        elseif e:GetName() == 'bomb_abortdefuse' then
            bomb.defusing = false
        elseif e:GetName() == 'round_officially_ended' or e:GetName() == 'bomb_defused' or e:GetName() == 'bomb_exploded' then
            bomb.defusing = false
            bomb.planting = false
            bomb.display = false
        end
        
        if e:GetName() == 'bomb_planted' then
            bomb.plantTime = globals.CurTime()
            bomb.planting = false
            bomb.display = true
        end
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------
-------------- Indicators
function _round(number, precision)
    local mult = 10 ^ (precision or 0)
    return math.floor(number * mult + 0.5) / mult
end

local indicator = {{}}
function draw.indicator(r,g,b,a, string)
   local new = {}
   local add = indicator[1]
   local x, y = draw.GetScreenSize()

   new.y = y / 1.4105 - #add * 35

   local i = #add + 1
   add[i] = {}

   setmetatable(add[i], new)
   new.__index = new
   new.r, new.g, new.b, new.a = r,g,b,a
   new.string = string or ""

   return new.y
end

callbacks.Register("Draw", function()
    local fontSkeetIndicators = draw.CreateFont('Verdana', 26, 800)
    local temp = {}
    local add = indicator[1]
    local _x, y = draw.GetScreenSize()
    local x = 12
    local c = 0

    draw.SetFont(fontSkeetIndicators)

    add.y = _round(y / 1.4105 - #temp * 35)

    for i = 1, #add do
        temp[#temp + 1] = add[i]
    end

    for i = 1, #temp do
        local _i = temp[i]

        local w, h = draw.GetTextSize(_i.string)
        local xa = _round(x + w * 0.45)
        local ya = add.y - 6
        local xb = add.y + 25

        draw.Color(_i.r, _i.g, _i.b, 255)
        draw.TextShadow(x + 1, add.y + 1.5, _i.string)

        add.y = add.y - 35
    end

    indicator[1] = {}
end)

function indicatorChangeColor(color, string)
    draw.indicator(color[1], color[2], color[3], color[4], string)
end

callbacks.Register('Draw', function()
    local enableColor = { 96, 0, 255, 255 }
    local disableColor = { 255, 0, 0, 255 }
    local defaultColor = { 124, 195, 13, 255 }

    if misc_indicators_enable:GetValue() and luaDisabledCondition then
        if radar_cache then
            indicatorChangeColor(enableColor, 'RADAR')
        else
            indicatorChangeColor(disableColor, 'RADAR')
        end

        -- indicatorChangeColor(defaultColor, 'TEST')
    end

end)
