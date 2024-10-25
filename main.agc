// Project: LifeCounter 
// Created: 2024-02-22

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "LifeCounter" )
SetWindowSize( 600, 1440, 0 )
SetWindowAllowResize( 0 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 600, 1440 ) // doesn't have to match the window
SetOrientationAllowed( 1, 0, 0, 0 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts

global p1life as integer = 20
global p2life as integer = 20
global p1plus as integer  =1
global p1minus as integer =2
global p2plus as integer =3
global p2minus as integer =4
global restart as integer = 5
global P1LifeText as integer = 0
global P2LifeText as integer = 1
init()

do
	drawLifeTotals()
	drawPlayerBoxes()
	LifeTotalButtons()
	Render()
    Sync()
loop

function init()
	buttonImage=GetImage(50, 50,200, 50)
	
    AddVirtualButton(p1plus,GetVirtualWidth()/2,GetVirtualHeight()/4+200,250)

    SetVirtualButtonAlpha(p1plus,50)
    SetVirtualButtonColor(p1plus,255,255,0)
    SetVirtualButtonText(p1plus,"+")
    SetVirtualButtonVisible(p1plus,1)

    AddVirtualButton(p1minus,GetVirtualWidth()/2,GetVirtualHeight()/4-50, 250)

    SetVirtualButtonAlpha(p1minus,50)
    SetVirtualButtonColor(p1minus,255,255,0)
    SetVirtualButtonText(p1minus,"-")
    SetVirtualButtonVisible(p1minus,1)
    

    AddVirtualButton(p2plus,GetVirtualWidth()/2,(GetVirtualHeight()/2+GetVirtualHeight())/2-200,250)
    SetVirtualButtonAlpha(p2plus,50)
    SetVirtualButtonColor(p2plus,255,255,0)
    SetVirtualButtonText(p2plus,"+")
    SetVirtualButtonVisible(p2plus,1)
    

    AddVirtualButton(p2minus,GetVirtualWidth()/2,(GetVirtualHeight()/2+GetVirtualHeight())/2+50,250)
    SetVirtualButtonAlpha(p2minus,50)
    SetVirtualButtonColor(p2minus,255,255,0)
    SetVirtualButtonText(p2minus,"-")
    SetVirtualButtonVisible(p2minus,1)
    
    AddVirtualButton(restart,25,GetVirtualHeight()/2+25,50)
    SetVirtualButtonAlpha(restart,50)
    SetVirtualButtonColor(restart,255,255,0)
    SetVirtualButtonText(restart,"Restart")
    SetVirtualButtonVisible(restart,1)

    
    
    P1LifeText=CreateText(str(p1life))
	SetTextX(P1LifeText, GetVirtualWidth()/2 +180)
	SetTextY(P1LifeText, GetVirtualHeight()/4 + 300)
	SetTextSize(P1LifeText,400)
	SetTextBold(P1LifeText, 1)
	SetTextVisible(P1LifeText, 1)
	SetTextAngle(P1LifeText, 180)
		
	p2LifeText=CreateText(str(p2life))
	SetTextX(P2LifeText, GetVirtualWidth()/2 -180)
	SetTextY(P2LifeText, (GetVirtualHeight()/2+GetVirtualHeight())/2 -300)
	SetTextSize(P2LifeText,400)
	SetTextBold(P2LifeText, 1)
	SetTextVisible(P2LifeText, 1) 

endfunction

function drawPlayerBoxes()
	b=MakeColor(0,136,255)
    b2=MakeColor(0,0,170)
    DrawBox(0,0,GetVirtualWidth(),GetVirtualHeight()/2,b,b,b,b,1)
    DrawBox(0,GetVirtualHeight()/2,GetVirtualWidth(),GetVirtualHeight(),b2,b2,b2,b2,1)
endfunction

function drawLifeTotals()	
	SetTextString ( P1LifeText, str(p1life) )
	SetTextString ( p2LifeText, str(p2life) )
	
	DrawText(P1LifeText)
	DrawText(p2LifeText)
endfunction

function AddButtons()
	AddVirtualButton(1, 0, 0, 50)
endfunction



function LifeTotalButtons()
    if GetVirtualButtonPressed(p1plus)=1
        p1life = p1life + 1
    elseif GetVirtualButtonPressed(p1minus)=1
		p1life = p1life-1
	elseif GetVirtualButtonPressed(p2plus)=1
		p2life = p2life+1
	elseif GetVirtualButtonPressed(p2minus)=1
		p2life = p2life-1
	elseif GetVirtualButtonPressed(restart)=1
		p2life = 20
		p1life = 20
    endif
endfunction
