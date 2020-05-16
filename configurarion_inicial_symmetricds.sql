select * from sym.sym_node
select * from sym.sym_node_group
select * from sym.sym_node_group_link
sym_router
sym_channel
sym_trigger
sym_trigger_router
sym_node_security
select * from sym.sym_node_identity

--Agregamos registro de nodos (suscriptores)
select * from sym.sym_node_group
insert into sym.sym_node_group values
('nodos','Servidores Suscriptores',current_timestamp,'daniel',
 current_timestamp)
 
--Agregamos los group link
select * from sym.sym_node_group_link
insert into sym.sym_node_group_link
(source_node_group_id,target_node_group_id,data_event_action,
 create_time,last_update_by,last_update_time)
 values (
'servidor','nodos','W',current_timestamp,'daniel',
 current_timestamp),
('nodos','servidor','P',current_timestamp,'daniel',
 current_timestamp);
 
 --Agregamos router
 select * from sym.sym_router
 insert into sym.sym_router
 (router_id,target_schema_name,source_node_group_id,target_node_group_id,
  sync_on_update,sync_on_insert,sync_on_delete,create_time,last_update_by,last_update_time
 )
 values
 ('servidor2nodos','public','servidor','nodos',1,1,1,current_timestamp,'daniel', current_timestamp),
 ('nodos2servidor','public','nodos','servidor',1,1,1,current_timestamp,'daniel', current_timestamp)
 
 --Agregamos Channel
 select * from sym.sym_channel
 insert into sym.sym_channel(channel_id,processing_order,max_batch_size,max_batch_to_send,
							max_data_to_route,description,create_time,last_update_by,last_update_time)
values
('catalogos',100,1000,50,10000,'Tablas de Catálogos',now(),'daniel',now())

--Agregar Tablas como Candidatas a Replicación
select * from sym.sym_trigger
insert into sym.sym_trigger
(trigger_id,source_schema_name,source_table_name,channel_id,sync_on_update,sync_on_delete,sync_on_insert
,create_time,last_update_by,last_update_time
)
values 
('empleados','public','empleados','catalogos',1,1,1,now(),'daniel',now())

--Poner a replicar la Tabla
select * from sym.sym_trigger_router
insert into sym.sym_trigger_router
(trigger_id,router_id,enabled,initial_load_order,create_time,last_update_by,last_update_time)
values ('empleados','servidor2nodos',1,10,now(),'daniel',now())


select * from sym.sym_node_security
update sym.sym_node_security set initial_load_enabled=1 where node_id='cliente1'

select * from empleados
insert into empleados (nombres,apellidos) values ('Pedro','Martìnez')
