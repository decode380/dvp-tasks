CREATE DATABASE DvpTasks;
GO

USE DvpTasks;
GO
CREATE LOGIN dvp_tasks WITH PASSWORD = 'DvpT4sk5';
GO
CREATE USER dvp_tasks FOR LOGIN dvp_tasks;
GO
ALTER ROLE db_datareader ADD MEMBER dvp_tasks;
ALTER ROLE db_datawriter ADD MEMBER dvp_tasks;
GO

GRANT VIEW DEFINITION ON DATABASE::DvpTasks TO dvp_tasks;
GO


CREATE TABLE [User](
	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	email varchar(100) NOT NULL,
	[password] varchar(150) NOT NULL,
	[name] nvarchar (100) NOT NULL,
);
GO

CREATE TABLE [Role](
	id varchar(30) PRIMARY KEY NOT NULL,
	[name] VARCHAR(50) NOT NULL
);
GO

CREATE TABLE [UserRole] (
    userId INT NOT NULL,
    roleId VARCHAR(30) NOT NULL,
    FOREIGN KEY (userId) REFERENCES [dbo].[User](id),
    FOREIGN KEY (roleId) REFERENCES [dbo].[Role](id),
    PRIMARY KEY (userId, roleId)
);
GO

CREATE TABLE [State](
    id VARCHAR(30) PRIMARY KEY NOT NULL,
    [name] NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE [TaskJob](
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    userId INT NOT NULL,
    [name] NVARCHAR(150) NOT NULL,
    [stateId] VARCHAR(30) NOT NULL,
    FOREIGN KEY(userId) REFERENCES [dbo].[User](id),
    FOREIGN KEY(stateId) REFERENCES [dbo].[State](id),
);
GO



INSERT INTO [User]
(
		 [email]
		,[password]
		,[name]
)
VALUES
(
		'admin@email.com'
		,'$2a$11$Losq4gwDWSAN2EvNjji8d.ilKQ7dPrjubikwOh7dBc6UtAsu0MGVS'
		,'Administrador'
),
(
		'supervisor@email.com'
		,'$2a$11$Losq4gwDWSAN2EvNjji8d.ilKQ7dPrjubikwOh7dBc6UtAsu0MGVS'
		,'Supervisor'
),
(
		'employee1@email.com'
		,'$2a$11$Losq4gwDWSAN2EvNjji8d.ilKQ7dPrjubikwOh7dBc6UtAsu0MGVS'
		,'Primer Trabajador'
),
(
		'employee2@email.com'
		,'$2a$11$Losq4gwDWSAN2EvNjji8d.ilKQ7dPrjubikwOh7dBc6UtAsu0MGVS'
		,'Segundo Trabajador'
),
(
		'employee3@email.com'
		,'$2a$11$Losq4gwDWSAN2EvNjji8d.ilKQ7dPrjubikwOh7dBc6UtAsu0MGVS'
		,'Tercer Trabajador'
);
GO


INSERT INTO [Role]
(
		 [id]
		,[name]
)
VALUES
(
		'ADMIN'
		,'Administrador'
),
(
		'EMPLOYEE'
		,'Empleado'
),
(
		'SUPERVISOR'
		,'Supervisor'
);
GO


INSERT INTO [UserRole]
(
		 [userId]
		,[roleId]
)
SELECT id, 'ADMIN' FROM [User] WHERE email = 'admin@email.com'

INSERT INTO [UserRole]
(
		 [userId]
		,[roleId]
)
SELECT id, 'SUPERVISOR' FROM [User] WHERE email = 'supervisor@email.com'


INSERT INTO [UserRole]
(
		 [userId]
		,[roleId]
)
SELECT id, 'EMPLOYEE' FROM [User] WHERE email in ('employee1@email.com', 'employee2@email.com', 'employee3@email.com')

INSERT INTO [State]
(
		 [id]
		,[name]
)
VALUES
(
		'COMPLETED'
		,'Completado'
),
(
		'IN_PROGRESS'
		,'En Proceso'
),
(
		'PENDING'
		,'Pendiente'
)
GO


INSERT INTO [TaskJob] ([userId],[name],[stateId])
VALUES
  (5,'ornare, lectus ante dictum','PENDING'),
  (4,'luctus vulputate, nisi sem','PENDING'),
  (3,'aliquam adipiscing lacus. Ut','COMPLETED'),
  (4,'aliquet diam. Sed diam','COMPLETED'),
  (4,'Aliquam adipiscing lobortis risus.','IN_PROGRESS'),
  (3,'luctus et ultrices posuere','IN_PROGRESS'),
  (4,'tristique pellentesque, tellus sem','PENDING'),
  (3,'quis, pede. Praesent eu','PENDING'),
  (4,'Proin vel nisl. Quisque','COMPLETED'),
  (3,'Curabitur dictum. Phasellus in','COMPLETED');
INSERT INTO [TaskJob] ([userId],[name],[stateId])
VALUES
  (5,'mollis nec, cursus a,','IN_PROGRESS'),
  (3,'Nullam suscipit, est ac','IN_PROGRESS'),
  (5,'egestas, urna justo faucibus','PENDING'),
  (4,'lacinia mattis. Integer eu','PENDING'),
  (4,'auctor quis, tristique ac,','COMPLETED'),
  (4,'convallis ligula. Donec luctus','COMPLETED'),
  (4,'Pellentesque tincidunt tempus risus.','IN_PROGRESS'),
  (4,'risus, at fringilla purus','IN_PROGRESS'),
  (5,'et ipsum cursus vestibulum.','PENDING'),
  (4,'adipiscing elit. Aliquam auctor,','PENDING');
INSERT INTO [TaskJob] ([userId],[name],[stateId])
VALUES
  (4,'in consectetuer ipsum nunc','COMPLETED'),
  (4,'purus gravida sagittis. Duis','COMPLETED'),
  (4,'consequat auctor, nunc nulla','IN_PROGRESS'),
  (3,'ut, sem. Nulla interdum.','IN_PROGRESS'),
  (4,'nec tempus mauris erat','PENDING'),
  (4,'in faucibus orci luctus','PENDING'),
  (4,'neque sed sem egestas','COMPLETED'),
  (4,'nibh enim, gravida sit','COMPLETED'),
  (3,'risus. Donec egestas. Duis','IN_PROGRESS'),
  (4,'pretium neque. Morbi quis','IN_PROGRESS');
INSERT INTO [TaskJob] ([userId],[name],[stateId])
VALUES
  (4,'porttitor eros nec tellus.','PENDING'),
  (4,'ut mi. Duis risus','PENDING'),
  (4,'morbi tristique senectus et','COMPLETED'),
  (4,'posuere cubilia Curae Phasellus','COMPLETED'),
  (3,'interdum ligula eu enim.','IN_PROGRESS');


