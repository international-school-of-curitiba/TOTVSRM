select IDPATRIMONIO from IPATRIMONIO where PATRIMONIO = 02340


delete IPATRIMONIOFILIAL where IDPATRIMONIO in (select IDPATRIMONIO from IPATRIMONIO where PATRIMONIO = 02340)
delete IPATRIMONIOCOMPL where IDPATRIMONIO in (select IDPATRIMONIO from IPATRIMONIO where PATRIMONIO = 02340)
delete IPATRIMONIORATEIOGER where IDPATRIMONIO in (select IDPATRIMONIO from IPATRIMONIO where PATRIMONIO = 02340)
delete ISALDOCALCULOPATRIMONIOMOEDA where IDPATRIMONIO in (select IDPATRIMONIO from IPATRIMONIO where PATRIMONIO = 02340)
delete ITAXADEPRECIACAO where IDCALCULOPATRIMONIO in (Select IDCALCULOPATRIMONIO from ICALCULOPATRIMONIO where IDPATRIMONIO in (select IDPATRIMONIO from IPATRIMONIO where PATRIMONIO = 02340))
delete ICALCULORAZAO where IDCALCULOPATRIMONIO in (Select IDCALCULOPATRIMONIO from ICALCULOPATRIMONIO where IDPATRIMONIO in (select IDPATRIMONIO from IPATRIMONIO where PATRIMONIO = 02340))
delete ICALCULOPATRIMONIO where IDPATRIMONIO in (select IDPATRIMONIO from IPATRIMONIO where PATRIMONIO = 02340)
delete IPATRIMONIOMOEDA where IDPATRIMONIO in (select IDPATRIMONIO from IPATRIMONIO where PATRIMONIO = 02340)
delete IPATRIMONIOCOMPL where IDPATRIMONIO in (select IDPATRIMONIO from IPATRIMONIO where PATRIMONIO = 02340)
delete IPATRIMONIO where PATRIMONIO = 02340