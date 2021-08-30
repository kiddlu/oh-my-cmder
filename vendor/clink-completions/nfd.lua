local parser = clink.arg.new_parser
local nfd_parser = parser(
	{
--buildin script
	"dialog",
	"multiple",
    "folder",
	"save"
    }
)         
clink.arg.register_parser("nfd", nfd_parser)
