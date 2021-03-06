--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
---------------------------Testing-Widgets--------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------------------------------
--Windows
demo_window = CustomWindow.create(100, 100, 750, 580, "Widgets List", false)
demo_window:setVisible(false)
demo_window:setCloseEnabled(true)
--bindKey("b", "up", function() demo_window:open() end)


demo_window_l = CustomWindow.create(1000, 100, 300, 200, "Disabled Window", false)
demo_window_l:setEnabled(false)
demo_window_l:setVisible(false)
--bindKey("n", "up", function() demo_window_l:open() end)

demo_window_m = CustomWindow.create(1000, 400, 300, 200, "Not Movable Window", false)
demo_window_m:setVisible(false)
demo_window_m:setCloseEnabled(true)
demo_window_m:setMovable(false)
--bindKey("m", "up", function() demo_window_m:open() end)

addCommandHandler("demowidgets", function()
	if demo_window_l:getVisible() then
		demo_window:close()
		demo_window_l:close()
		demo_window_m:close()
		showCursor(false)
	else
		demo_window:open()
		demo_window_l:open()
		demo_window_m:open()
		showCursor(true)
	end
end)

addEventHandler("onClientGUIClick", root, function() 
	if source == demo_window.Window.Close then
		if not demo_window_m:getVisible() then
			showCursor(false)
		end
	elseif source == demo_window_m.Window.Close then
		if not demo_window:getVisible() then
			showCursor(false)
		end
	end
end)

----------------------------------------------------------------------------------------------------------------------------------------------
--Buttons
test_button = CustomButton.create(10, 30, 100, 40, "Texted", false, demo_window.Window.Frame)
test_imgs = CustomButton.create(10, 80, 100, 40, "Removed Text", false, demo_window.Window.Frame)
test_imgtxt = CustomButton.create(10, 130, 100, 40, "Imaged", false, demo_window.Window.Frame)

test_imgs:setText("")
test_imgs:setImage(Images.Point)
test_imgs.Button.Image:setProperty("ImageColours", "tl:FF62D262 tr:FF62D262 bl:FF62D262 br:FF62D262")
--test_imgs:setColorScheme(RedColors)

test_imgtxt:setImage(Images.Cross)
test_imgtxt.Button.Image:setProperty("ImageColours", "tl:FF62D262 tr:FF62D262 bl:FF62D262 br:FF62D262")
--test_imgtxt:setColorScheme(BlueColors)

test_but_locked = CustomButton.create(10, 180, 100, 40, "Disabled", false, demo_window.Window.Frame)
--test_but_locked:setColorScheme(BlueColors)
test_but_locked:setEnabled(false)

test_but_locked2 = CustomButton.create(100, 60, 100, 40, "Disabled", false, demo_window_l.Window.Frame)
test_but_locked2:setEnabled(false)
--test_but_locked2:setColorScheme(BlueColors)

test_but_clicked2 = CustomButton.create(100, 110, 100, 40, "Clicked", false, demo_window_l.Window.Frame)

test_but_locked3 = CustomButton.create(100, 60, 100, 40, "Disabled", false, demo_window_m.Window.Frame)
test_but_locked3:setEnabled(false)

test_but_clicked3 = CustomButton.create(100, 110, 100, 40, "Clicked", false, demo_window_m.Window.Frame)

----------------------------------------------------------------------------------------------------------------------------------------------
--Progress bars
test_pbar = CustomProgressBar.create(10, 230, 100, 20, false, demo_window.Window.Frame)
test_pbar:setProgress(0)
--test_pbar:setColorScheme(BlueColors)

test_pbar2 = CustomProgressBar.create(10, 265, 100, 10, false, demo_window.Window.Frame)
test_pbar2:setProgress(50)
--test_pbar2:setColorScheme(BlueColorsDark)

test_pbar3 = CustomProgressBar.create(10, 290, 100, 20, false, demo_window.Window.Frame)
test_pbar3:setProgress(100)

test_pbar4 = CustomProgressBar.create(20, 320, 20, 200, false, demo_window.Window.Frame)
test_pbar4:setProgress(0)

test_pbar5 = CustomProgressBar.create(55, 320, 10, 200, false, demo_window.Window.Frame)
test_pbar5:setProgress(50)
--test_pbar5:setColorScheme(RedColors)

test_pbar6 = CustomProgressBar.create(80, 320, 20, 200, false, demo_window.Window.Frame)
test_pbar6:setProgress(100)

----------------------------------------------------------------------------------------------------------------------------------------------
--Scroll bars
test_scver = CustomScrollBar.create(120, 30, 10, 490, false, demo_window.Window.Frame)
test_scver_l = CustomScrollBar.create(140, 30, 20, 490, false, demo_window.Window.Frame)
test_schor = CustomScrollBar.create(10, 530, 150, 10, false, demo_window.Window.Frame)
test_schor_l = CustomScrollBar.create(10, 550, 150, 20, false, demo_window.Window.Frame)

test_scver:setScrollPosition(10)
test_scver:setScrollLength(90)

test_scver_l:setScrollPosition(40)
test_scver_l:setScrollLength(30)
test_scver_l:setEnabled(false)

test_schor:setScrollPosition(50)
test_schor:setScrollLength(50)
test_schor:setScrollSpeed(10)

test_schor_l:setScrollPosition(100)
test_schor_l:setScrollLength(40)
test_schor_l:setEnabled(false)

--test_scver:setColorScheme(BlueColors)
--test_schor:setColorScheme(BlueColorsDark)

addEvent("onCustomScrollBarScrolled", true)
addEventHandler("onCustomScrollBarScrolled", root, function(element)
	if element == test_scver.ScrollBar.Canvas then
		test_pbar5:setProgress(test_scver:getScrollPosition())
	end
end)

addEvent("onCustomScrollBarScrolled", true)
addEventHandler("onCustomScrollBarScrolled", root, function(element)
	if element == test_schor.ScrollBar.Canvas then
		test_pbar2:setProgress(test_schor:getScrollPosition())
	end
end)

----------------------------------------------------------------------------------------------------------------------------------------------
--Edit/Memo/Number boxes
test_edit = CustomEdit.create(170, 30, 250, 30, "EditBox", false, demo_window.Window.Frame)
test_edit_l = CustomEdit.create(170, 70, 250, 30, "EditBox Disabled", false, demo_window.Window.Frame)
test_edit_m = CustomEdit.create(170, 110, 250, 30, "EditBox Masked", false, demo_window.Window.Frame)
test_edit_r = CustomEdit.create(170, 150, 250, 30, "EditBox ReadOnly", false, demo_window.Window.Frame)

test_memo = CustomMemo.create(170, 190, 250, 200, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", false, demo_window.Window.Frame)
test_memo_l = CustomMemo.create(170, 400, 250, 80, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ", false, demo_window.Window.Frame)
test_memo_r = CustomMemo.create(170, 490, 250, 83, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ", false, demo_window.Window.Frame)

test_numscroll = CustomNumberScroller.create(430, 30, 150, 30, false, demo_window.Window.Frame)
test_numscroll_l = CustomNumberScroller.create(430, 70, 150, 30, false, demo_window.Window.Frame)
test_numscroll_r = CustomNumberScroller.create(590, 30, 30, 30, false, demo_window.Window.Frame)

test_numscroll_r:setSize(150, 70, false)

--test_edit:setColorScheme(BlueColors)
--test_memo_r:setColorScheme(RedColors)
--test_numscroll:setColorScheme(RedColors)
--test_memo:setColorScheme(BlueColors)

test_edit_l:setEnabled(false)
test_memo_l:setEnabled(false)
test_numscroll_l:setEnabled(false)

test_edit_m:setMasked(true)

test_edit_r:setReadOnly(true)
test_memo_r:setReadOnly(true)
test_numscroll_r:setReadOnly(true)
test_numscroll_r:setText(49)

----------------------------------------------------------------------------------------------------------------------------------------------
--Check boxes

test_checkbox = CustomCheckBox.create(430, 120, 150, 30, "Dark", false, demo_window.Window.Frame)
test_checkbox_e = CustomCheckBox.create(430, 160, 150, 30, "Blue", false, demo_window.Window.Frame)
test_checkbox_d = CustomCheckBox.create(590, 120, 150, 30, "Disabled", false, demo_window.Window.Frame)
test_checkbox_d_e = CustomCheckBox.create(590, 160, 150, 30, "Disabled Activated", false, demo_window.Window.Frame)

test_checkbox_e:setChecked(true)
test_checkbox_d:setEnabled(false)

--test_checkbox:setColorScheme(BlueColorsDark)
--test_checkbox_e:setColorScheme(RedColors)

test_checkbox_d_e:setChecked(true)
test_checkbox_d_e:setEnabled(false)

----------------------------------------------------------------------------------------------------------------------------------------------
--Combo boxes
test_combo = CustomComboBox.create(430, 200, 150, 30, "Select...", false, demo_window.Window.Frame)
test_combo_d = CustomComboBox.create(430, 240, 150, 30, "Disabled", false, demo_window.Window.Frame)
test_combo_s = CustomComboBox.create(590, 200, 50, 20, "Sized", false, demo_window.Window.Frame)

for i = 1, 20 do
	test_combo:addItem("Test"..i)
	test_combo_d:addItem("Test"..i)
	test_combo_s:addItem("Test"..i)
end

test_combo:setMaxHeight(450)
--test_combo:setColorScheme(BlueColors)

test_combo_d:setEnabled(false)
test_combo_s:setMaxHeight(200)
test_combo_s:setSize(150, 70, false)

----------------------------------------------------------------------------------------------------------------------------------------------
--Tab panels
test_tab = CustomTabPanel.create(430, 280, 40, 40, false, demo_window.Window.Frame)
test_tab_d = CustomTabPanel.create(430, 430, 310, 140, false, demo_window.Window.Frame)

--test_tab:setColorScheme(BlueColors)
--test_tab_d:setColorScheme(RedColors)
for i = 1, 5 do
	test_tab:addTab("Tab "..i)
	test_tab_d:addTab("Tab "..i)
end

test_tab:setSize(310, 140, false)
test_tab:setSelectedTab("Tab 2")
test_tab:setTabEnabled("Tab 3", false)
test_tab:setTabVisible("Tab 4", false)
test_tab:setTabsMinLength(200)
test_tab_d:setTabsMinLength(150)
test_tab_d:setSelectedTab("Tab 3")

test_tab_d:setEnabled(false)

local image1 = GuiStaticImage.create(40, 10, 30, 20, pane, false, test_tab:getTabFromText("Tab 1"))
local image2 = GuiStaticImage.create(72, 32, 40, 30, pane, false, test_tab:getTabFromText("Tab 1"))
local image3 = GuiStaticImage.create(114, 64, 50, 40, pane, false, test_tab:getTabFromText("Tab 1"))

local image4 = GuiStaticImage.create(40, 10, 30, 20, pane, false, test_tab:getTabFromText("Tab 2"))
local image5 = GuiStaticImage.create(72, 32, 40, 30, pane, false, test_tab:getTabFromText("Tab 2"))
local image6 = GuiStaticImage.create(114, 64, 50, 40, pane, false, test_tab:getTabFromText("Tab 2"))

local image7 = GuiStaticImage.create(40, 10, 30, 20, pane, false, test_tab:getTabFromText("Tab 5"))
local image8 = GuiStaticImage.create(72, 32, 40, 30, pane, false, test_tab:getTabFromText("Tab 5"))
local image9 = GuiStaticImage.create(114, 64, 50, 40, pane, false, test_tab:getTabFromText("Tab 5"))

image1:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", DefaultColors.Main, DefaultColors.Main, DefaultColors.Main, DefaultColors.Main)) 
image2:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", DefaultColors.Main, DefaultColors.Main, DefaultColors.Main, DefaultColors.Main)) 
image3:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", DefaultColors.Main, DefaultColors.Main, DefaultColors.Main, DefaultColors.Main)) 

image4:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", DefaultColors.DarkMain, DefaultColors.DarkMain, DefaultColors.DarkMain, DefaultColors.DarkMain)) 
image5:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", DefaultColors.DarkMain, DefaultColors.DarkMain, DefaultColors.DarkMain, DefaultColors.DarkMain)) 
image6:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", DefaultColors.DarkMain, DefaultColors.DarkMain, DefaultColors.DarkMain, DefaultColors.DarkMain)) 

image7:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", DefaultColors.LightMain, DefaultColors.LightMain, DefaultColors.LightMain, DefaultColors.LightMain)) 
image8:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", DefaultColors.LightMain, DefaultColors.LightMain, DefaultColors.LightMain, DefaultColors.LightMain)) 
image9:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", DefaultColors.LightMain, DefaultColors.LightMain, DefaultColors.LightMain, DefaultColors.LightMain)) 

---------------------------------------

demo_window:addElements({test_button, test_imgs, test_imgtxt, test_but_locked})
demo_window:addElements({test_pbar, test_pbar2, test_pbar3, test_pbar4, test_pbar5, test_pbar6})
demo_window:addElements({test_scver, test_scver_l, test_schor, test_schor_l})
demo_window:addElements({test_edit, test_edit_l, test_edit_m, test_edit_r, test_memo, test_memo_l, test_memo_r, test_numscroll, test_numscroll_l, test_numscroll_r})
demo_window:addElements({test_checkbox, test_checkbox_e, test_checkbox_d, test_checkbox_d_e})
demo_window:addElements({test_combo, test_combo_d, test_combo_s})
demo_window:addElements({test_tab, test_tab_d})
demo_window:setColorScheme(BlueColorsDark)

themes = {RedColorsDark, BlueColorsDark, RedColors, BlueColors}
indx = 1

test_checkbox:addEvent("onClientGUIClick", function()

	--outputDebugString("Checkbox 1 (Dark/Light) Changed to '"..tostring(test_checkbox:getChecked()).."', Theme ID = "..tostring(indx))

	if test_checkbox:getChecked() then
		indx = indx + 2
		test_checkbox:setText("Light")
	else
		indx = indx - 2
		test_checkbox:setText("Dark")
	end

	demo_window:setColorScheme(themes[indx+1])
end)

test_checkbox_e:addEvent("onClientGUIClick", function()

	--outputDebugString("Checkbox 2 (Red/Blue) Changed to '"..tostring(test_checkbox_e:getChecked()).."', Theme ID = "..tostring(indx))

	if test_checkbox_e:getChecked() then
		indx = indx + 1
		test_checkbox_e:setText("Blue")
	else
		indx = indx - 1
		test_checkbox_e:setText("Red")
	end

	demo_window:setColorScheme(themes[indx+1])
	
end)

local test_timer
test_button:addEvent("onClientMouseEnter", function()
	test_button:setText("Hover")
end)

test_button:addEvent("onClientMouseLeave", function()
	if isTimer(test_timer) then killTimer(test_timer) end
	test_button:setText("Texted")
end)

test_button:addEvent("onClientGUIClick", function()

	if demo_window_l:getVisible() then
		demo_window_l:close()
	else
		demo_window_l:open()
	end
	
	test_button:setText("Clicked")

	test_timer = setTimer(function()
		test_button:setText("Hover")
	end, 1000, 1)

end)

test_imgtxt:addEvent("onClientMouseEnter", function()
	test_imgtxt:setImage(Images.Down)
end)

test_imgtxt:addEvent("onClientMouseLeave", function()
	test_imgtxt:setImage(Images.Cross)
end)

test_combo:addEvent("onClientGUIClick", function()
	--outputDebugString("Selected from 1s combo: "..tostring(test_combo:getSelectedItem()))
	test_edit:setText("Selected from 1s combo: "..tostring(test_combo:getSelectedItem()))
end)



--[[addEventHandler("onClientGUIClick", test_checkbox.CheckBox.Entrail, function()
	outputDebugString("Check changed")
end)]]