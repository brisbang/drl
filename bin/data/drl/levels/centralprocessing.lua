-- CENTRAL PROCESSING  --------------------------------------------------------

register_level "central_processing"
{
	name  = "Central Processing",
	entry = "On @1 he trekked through Central Processing.",
	welcome = "You enter Central Processing. You shudder, thinking about the evil mastermind who planned this.",
	level = 4,

	Create = function ()
		level:set_generator_style( 1 )
		level:fill( "wall" )

		local translation = {
			['.'] = "floor",
			['#'] = { "wall",  flags = { LFPERMANENT } },
			['>'] = "stairs",

			['h'] = { "floor", being = "former" },
		}
		


		local map = [=[
############################################################################
##hhhhhhhhhhhhh#############################################################
##hhhhhhhhhhhhh#############################################################
##hhhhhhhhhhhhh#############################################################
##hhhhhhhhhhhhh#############################################################
##hhhhhhhhhhhhh#############################################################
##hhhhhhhhhhhhh#############################################################
##hhhhhhhhhhhhh#############################################################
############################################################################
###.....########>###########################################################
###.....####################################################################
###.....####################################################################
############################################################################
##hhhhhhhhhhhhh#############################################################
##hhhhhhhhhhhhh#############################################################
##hhhhhhhhhhhhh#############################################################
##hhhhhhhhhhhhh#############################################################
##hhhhhhhhhhhhh#############################################################
]=]



		generator.place_tile( translation, map, 2, 2 )

		generator.set_permanence( area.FULL )
		level.data.kill_all  = false

		level:player(5,12)
	end,

	OnKillAll = function ()
		level.data.kill_all  = true
		ui.msg("\"The machinery falls silent\"")
		level.status = 4
	end,

	OnEnterLevel = function ()
		level.status = 0
	end,

	OnExit = function ()
		if level.data.kill_all  then
			ui.msg("No meat left to process.")
			player:add_history("Nothing stood in his way.")
		else
			ui.msg("Just too many to count.")
			player:add_history("He couldn't quite finish the job.")
		end
	end,


}