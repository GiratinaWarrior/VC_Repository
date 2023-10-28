/// @description Insert description here
// You can write your code in this editor

DrawSetText(c_red, ft_Sign, fa_center, fa_middle);

draw_set_alpha(TipFade);

draw_text_ext_transformed(x, y, CurrentTip, 20, 2000, 1, 1, 0);
draw_set_alpha(1);

TipFade += TipFadeChange;

if (TipFade > TipFadeLimit && TipFadeChange > 0)
{
	TipFadeChange *= -1;
}

else if (TipFade < -0.5 && TipFadeChange < 0)
{
	TipFadeChange *= -1;
	
	do
	{
		NextTip = TipText[irandom_range(0, array_length(TipText) - 1)];
	} until (NextTip != CurrentTip);
	
	CurrentTip = NextTip;
}

show_debug_message("Tip Fade: {0}", TipFade);
show_debug_message("Tip Change: {0}", TipFadeChange);
