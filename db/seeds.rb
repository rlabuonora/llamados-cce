# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email


c1 = Call.create(nombre: "Vidrieras", centro: "Rivera", modalidad: "Capacitación", publico: "Empresas")
c2 = Call.create(nombre: "Validación de Ideas", centro: "Tacuarembó", modalidad: "Capacitación", publico: "Emprendedores")


Proposal.create(proveedor: "Kolping", call: c1)
Proposal.create(proveedor: "Thinkify", call: c1)

Proposal.create(proveedor: "Gepián", call: c2)
