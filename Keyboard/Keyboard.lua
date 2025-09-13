script_name('KeySBoard') -- 
script_author('NeaDuruki')

--SETTINGS
-----------------------------------------------------------------------
local pressed_r, pressed_g, pressed_b = 1, 0, 0.3                      
local not_pressed_r, not_pressed_g, not_pressed_b = 0.29, 0.29, 0.29   
local pressed_letter_r, pressed_letter_g, pressed_letter_b = 0, 0.93, 1
local background_color_r, background_color_g, background_color_b = 0.05, 0.05, 0.05
local background_color_alpha = 0.5

local pressed_alpha = 1.00
local not_pressed_alpha = 1.00
local pressed_letter_alpha = 1.00
-----------------------------------------------------------------------

--REQUIREMENTS
-----------------------------------------------------------------------
local imgui = require("imgui")
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
local inicfg = require 'inicfg'
-----------------------------------------------------------------------



--LOCALS
-----------------------------------------------------------------------
local directIni = 'KeystrokesMod.ini'
local ini = inicfg.load(inicfg.load({
	settings = {      
        posX = 10,
        posY = 600,  
	},
    color_pressed = {
        r = 1.00,
        g = 0.0,
        b = 0.0,
        a = 1.00
    },
    color_notpressed = {
        r = 0.24,
        g = 0.24,
        b = 0.24,
        a = 0.50
    },
    color_text = {
        r = 1.0,
        g = 1.0,
        b = 1.0,
        a = 1.00
    }, 
    color_background = {
        r = 1.0,
        g = 1.0,
        b = 1.0,
        a = 1.00
    }, 
}, directIni))

inicfg.save(ini, directIni)

local window = imgui.ImBool(false)
local window2 = imgui.ImBool(false)

local im_color =  imgui.ImFloat4(ini.color_text.r, ini.color_text.g, ini.color_text.b, ini.color_text.a)
local im_color2 =  imgui.ImFloat4(ini.color_pressed.r, ini.color_pressed.g, ini.color_pressed.b, ini.color_pressed.a) 
local im_color3 =  imgui.ImFloat4(ini.color_notpressed.r, ini.color_notpressed.g, ini.color_notpressed.b, ini.color_notpressed.a) 
local im_color4 =  imgui.ImFloat4(ini.color_background.r, ini.color_background.g, ini.color_background.b, ini.color_background.a) 

local EBANAYA_ZALUPA_BLYAT_X = ini.settings.posX
local EBANAYA_ZALUPA_BLYAT_Y = ini.settings.posY
-----------------------------------------------------------------------

function main()
    while not isSampAvailable() do wait(200) end
    imgui.Process = false
    sampAddChatMessage('{ff9700}['..thisScript().name..']: {ededed}El Mod ha sido cargado Correctamente.', -1)
    sampRegisterChatCommand('keys', function() 
        window2.v = not window2.v 
        imgui.Process = window2.v
    end)
    window.v = true 
    window2.v = false
    imgui.Process = window.v
    while true do
        wait(0)
    end
end

function imgui.OnDrawFrame()
    if window.v then
        button_size = 35
        small_button_size = 25
        imgui.ShowCursor = false
        imgui.SetNextWindowPos(imgui.ImVec2(ini.settings.posX + 95, ini.settings.posY + 63), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(button_size * 6 + 20, 165), imgui.Cond.FirstUseEver)
        imgui.PushStyleColor(imgui.Col.WindowBg, imgui.ImVec4(im_color4.v[1], im_color4.v[2], im_color4.v[3], im_color4.v[4]))
        imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(im_color.v[1], im_color.v[2], im_color.v[3], im_color.v[4]))
        imgui.Begin('Teclas en Pantalla', window, imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.NoResize)
        
        --w
        imgui.SetCursorPos(imgui.ImVec2(button_size + 10, 5))
        if isKeyDown(87) then 
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color2.v[1], im_color2.v[2], im_color2.v[3], 1.00))
        else
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color3.v[1], im_color3.v[2], im_color3.v[3], 1.00))
        end
        imgui.Button('W', imgui.ImVec2(button_size, button_size))
        imgui.PopStyleColor()

        --a
        imgui.SetCursorPos(imgui.ImVec2(5, button_size + 10))
        if isKeyDown(65) then 
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color2.v[1], im_color2.v[2], im_color2.v[3], 1.00))
        else
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color3.v[1], im_color3.v[2], im_color3.v[3], 1.00))
        end
        imgui.Button('A', imgui.ImVec2(button_size, button_size))
        imgui.PopStyleColor()
        
        --s
        imgui.SetCursorPos(imgui.ImVec2(button_size + 10, button_size + 10))
        if isKeyDown(83) then 
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color2.v[1], im_color2.v[2], im_color2.v[3], 1.00))
        else
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color3.v[1], im_color3.v[2], im_color3.v[3], 1.00))
        end
        imgui.Button('S', imgui.ImVec2(button_size, button_size))
        imgui.PopStyleColor()
        
        --D
        imgui.SetCursorPos(imgui.ImVec2(button_size * 2 + 15, button_size + 10))
        if isKeyDown(68) then 
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color2.v[1], im_color2.v[2], im_color2.v[3], 1.00))
        else
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color3.v[1], im_color3.v[2], im_color3.v[3], 1.00))
        end
        imgui.Button('D', imgui.ImVec2(button_size, button_size))
        imgui.PopStyleColor()
        
        --Q
        imgui.SetCursorPos(imgui.ImVec2(15, 15))
        if isKeyDown(81) then 
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color2.v[1], im_color2.v[2], im_color2.v[3], 1.00))
        else
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color3.v[1], im_color3.v[2], im_color3.v[3], 1.00))
        end
        imgui.Button('Q', imgui.ImVec2(small_button_size, small_button_size))
        imgui.PopStyleColor()

        --E
        imgui.SetCursorPos(imgui.ImVec2(button_size * 2 + 15, 15))
        if isKeyDown(69) then 
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color2.v[1], im_color2.v[2], im_color2.v[3], 1.00))
        else
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color3.v[1], im_color3.v[2], im_color3.v[3], 1.00))
        end
        imgui.Button('E', imgui.ImVec2(small_button_size, small_button_size))
        imgui.PopStyleColor()
        
        --C
        imgui.SetCursorPos(imgui.ImVec2(button_size * 2 + button_size / 2 + 10 , button_size + button_size  + 15))
        if isKeyDown(67) then 
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color2.v[1], im_color2.v[2], im_color2.v[3], 1.00))
        else
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color3.v[1], im_color3.v[2], im_color3.v[3], 1.00))
        end
        imgui.Button('C', imgui.ImVec2(button_size, button_size))
        imgui.PopStyleColor()

        --SHIFT
        imgui.SetCursorPos(imgui.ImVec2(5, button_size * 2 + 15))
        if isKeyDown(16) then 
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color2.v[1], im_color2.v[2], im_color2.v[3], 1.00))
        else
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color3.v[1], im_color3.v[2], im_color3.v[3], 1.00))
        end
        imgui.Button('SHIFT', imgui.ImVec2(button_size * 2 + button_size / 2, button_size))
        imgui.PopStyleColor()

        --SPACE
        
        imgui.SetCursorPos(imgui.ImVec2(5, button_size * 3 + 20))
        if isKeyDown(32) then 
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color2.v[1], im_color2.v[2], im_color2.v[3], 1.00))
            
        else
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color3.v[1], im_color3.v[2], im_color3.v[3], 1.00))
        end
        imgui.Button('ESPACIO', imgui.ImVec2(button_size * 5 + button_size + 15  , button_size))
        
        imgui.PopStyleColor()



        --MOUSE

        imgui.SetCursorPos(imgui.ImVec2(button_size * 4 + 5, 5))
        if isKeyDown(1) then 
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color2.v[1], im_color2.v[2], im_color2.v[3], 1.00))
            
        else
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color3.v[1], im_color3.v[2], im_color3.v[3], 1.00))
        end
        imgui.Button('LMB', imgui.ImVec2(button_size, button_size * 3 + 10))
        imgui.PopStyleColor()


        imgui.SetCursorPos(imgui.ImVec2(button_size * 5 + 15, 5))
        if isKeyDown(2) then 
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color2.v[1], im_color2.v[2], im_color2.v[3], 1.00))
            
        else
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(im_color3.v[1], im_color3.v[2], im_color3.v[3], 1.00))
        end
        imgui.Button('RMB', imgui.ImVec2(button_size, button_size * 3 + 10))
        imgui.PopStyleColor()







        current_pos = imgui.GetWindowPos()
        EBANAYA_ZALUPA_BLYAT_X = current_pos.x 
        EBANAYA_ZALUPA_BLYAT_Y = current_pos.y
        imgui.End()
        imgui.PopStyleColor(2)
    end

    if window2.v then
        --FrameBg
        imgui.ShowCursor = true
        sizeX = 175
        sizeY = 200
        resX, resY = getScreenResolution()

        imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(sizeX, sizeY), imgui.Cond.FirstUseEver)
        imgui.PushStyleColor(imgui.Col.WindowBg, imgui.ImVec4(0.0, 0.0, 0.0, 0.5))
        imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(1.00, 1.00, 1.00, 1.00))
        imgui.Begin('Configuracion de Color', window2, imgui.WindowFlags.NoResize)
        
        --
        imgui.Text('Color de las Letras')
        if imgui.ColorEdit4("###1", im_color) then 
            print(im_color.v[1])
            pressed_letter_r, pressed_letter_g, pressed_letter_b, pressed_letter_a = im_color.v[1],  im_color.v[2],  im_color.v[3],  1.00
		end

        imgui.Text('Color al Pulsar las Teclas')
        if imgui.ColorEdit4("###2", im_color2) then 
            print(im_color2.v[1])
            pressed_r, pressed_g, pressed_b, pressed_a = im_color2.v[1], im_color2.v[2], im_color2.v[3], 1.00
            pressed_b = im_color2.v[3]
            
		end

        imgui.Text('Color de las Teclas')
        if imgui.ColorEdit4("###3", im_color3) then 
            print(im_color3.v[1])
            not_pressed_r, not_pressed_g, not_pressed_b, not_pressed_a = im_color3.v[1], im_color3.v[2], im_color3.v[3], 1.00
            not_pressed_b = im_color3.v[3]
		end

        imgui.Text('Color del Fondo')
        if imgui.ColorEdit4("###4", im_color4) then 
            
		end

        

        imgui.SetCursorPos(imgui.ImVec2(5, sizeX - 5))
        if imgui.Button('Guardar Configuracion', imgui.ImVec2(sizeX - 10, 25)) then
            --pressed
            ini.color_pressed.r = im_color2.v[1]
            ini.color_pressed.g = im_color2.v[2]
            ini.color_pressed.b = im_color2.v[3]

            --not pressed
            ini.color_notpressed.r = im_color3.v[1]
            ini.color_notpressed.g = im_color3.v[2]
            ini.color_notpressed.b = im_color3.v[3]

            --text
            ini.color_text.r = im_color.v[1]
            ini.color_text.g = im_color.v[2]
            ini.color_text.b = im_color.v[3]

            --back
            ini.color_background.r = im_color4.v[1]
            ini.color_background.g = im_color4.v[2]
            ini.color_background.b = im_color4.v[3]
            ini.color_background.a = im_color4.v[4]
            save()
            sampAddChatMessage('{ff9700}['..thisScript().name..']: {ededed}'..'La Configuracion ha sido Guardada.', -1)
        end
        
        imgui.End()
        imgui.PopStyleColor(2)
    end
end

function onScriptTerminate(script, quitGame)
    if script == thisScript() then
        ini.settings.posX = EBANAYA_ZALUPA_BLYAT_X + 20
        ini.settings.posY = EBANAYA_ZALUPA_BLYAT_Y + 20
        save()
    end
end

function save()
    inicfg.save(ini, directIni)
end


function CherryTheme()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2
  
  
    style.WindowPadding = ImVec2(6, 4)
    style.FramePadding = ImVec2(5, 2)
    style.FrameRounding = 3.0
    style.ItemSpacing = ImVec2(7, 1)
    style.ItemInnerSpacing = ImVec2(1, 1)
    style.TouchExtraPadding = ImVec2(0, 0)
    style.IndentSpacing = 6.0
    style.ScrollbarSize = 12.0
    style.ScrollbarRounding = 16.0
    style.GrabMinSize = 20.0
    style.GrabRounding = 2.0
  
    style.WindowTitleAlign = ImVec2(0.5, 0.5)
  

    colors[clr.ChildWindowBg] = ImVec4(0.200, 0.220, 0.270, 0.58)
    colors[clr.PopupBg] = ImVec4(0.200, 0.220, 0.270, 0.9)
    colors[clr.Border] = ImVec4(0.31, 0.31, 1.00, 0.00)
    colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.FrameBg] = ImVec4(0.200, 0.220, 0.270, 1.00)
    colors[clr.FrameBgHovered] = ImVec4(0.455, 0.198, 0.301, 0.78)
    colors[clr.FrameBgActive] = ImVec4(0.455, 0.198, 0.301, 1.00)
    colors[clr.TitleBg] = ImVec4(0.232, 0.201, 0.271, 1.00)
    colors[clr.TitleBgActive] = ImVec4(0.502, 0.075, 0.256, 1.00)
    colors[clr.TitleBgCollapsed] = ImVec4(0.200, 0.220, 0.270, 0.75)
    colors[clr.MenuBarBg] = ImVec4(0.200, 0.220, 0.270, 0.47)
    colors[clr.ScrollbarBg] = ImVec4(0.200, 0.220, 0.270, 1.00)
    colors[clr.ScrollbarGrab] = ImVec4(0.09, 0.15, 0.1, 1.00)
    colors[clr.ScrollbarGrabHovered] = ImVec4(0.455, 0.198, 0.301, 0.78)
    colors[clr.ScrollbarGrabActive] = ImVec4(0.455, 0.198, 0.301, 1.00)
    colors[clr.CheckMark] = ImVec4(0.71, 0.22, 0.27, 1.00)
    colors[clr.SliderGrab] = ImVec4(0.47, 0.77, 0.83, 0.14)
    colors[clr.SliderGrabActive] = ImVec4(0.71, 0.22, 0.27, 1.00)
    colors[clr.Button] = ImVec4(0.47, 0.77, 0.83, 0.14)
    colors[clr.ButtonHovered] = ImVec4(0.455, 0.198, 0.301, 0.86)
    colors[clr.ButtonActive] = ImVec4(0.455, 0.198, 0.301, 1.00)
    colors[clr.Header] = ImVec4(0.455, 0.198, 0.301, 0.76)
    colors[clr.HeaderHovered] = ImVec4(0.455, 0.198, 0.301, 0.86)
    colors[clr.HeaderActive] = ImVec4(0.502, 0.075, 0.256, 1.00)
    colors[clr.ResizeGrip] = ImVec4(0.47, 0.77, 0.83, 0.04)
    colors[clr.ResizeGripHovered] = ImVec4(0.455, 0.198, 0.301, 0.78)
    colors[clr.ResizeGripActive] = ImVec4(0.455, 0.198, 0.301, 1.00)
    colors[clr.PlotLines] = ImVec4(0.860, 0.930, 0.890, 0.63)
    colors[clr.PlotLinesHovered] = ImVec4(0.455, 0.198, 0.301, 1.00)
    colors[clr.PlotHistogram] = ImVec4(0.860, 0.930, 0.890, 0.63)
    colors[clr.PlotHistogramHovered] = ImVec4(0.455, 0.198, 0.301, 1.00)
    colors[clr.TextSelectedBg] = ImVec4(0.455, 0.198, 0.301, 0.43)
    colors[clr.ModalWindowDarkening] = ImVec4(0.200, 0.220, 0.270, 0.73)
  end
  CherryTheme()