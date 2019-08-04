module("luci.controller.firewall", package.seeall)

function index()
	entry({"admin", "network", "firewall"},
		alias("admin", "network", "firewall", "zones"),
		_("Firewall"), 60)

	entry({"admin", "network", "firewall", "zones"},
		view("firewall/zones"), _("General Settings"), 10)

	entry({"admin", "network", "firewall", "forwards"},
		view("firewall/forwards"), _("Port Forwards"), 20)

	entry({"admin", "network", "firewall", "rules"},
		view("firewall/rules"), _("Traffic Rules"), 30)

	entry({"admin", "network", "firewall", "custom"},
		form("firewall/custom"),
		_("Custom Rules"), 40).leaf = true
end
