CREATE TABLE ResponsavelDepartamento (
    ResponsavelDepartamentoId int not null identity primary key,
    CodigoDepartamento varchar(10) not null unique,
    Nome varchar(255) not null,
    Login varchar(255) not null unique,
    Email varchar(255) not null unique
);
GO;

CREATE PROCEDURE InsereResponsavelDepartamento
  @CodigoDepartamento varchar(10),
  @Nome varchar(255),
  @Login varchar(255),
  @Email varchar(255)
AS
BEGIN TRANSACTION;
UPDATE ResponsavelDepartamento SET
    Nome = @Nome, Login = @Login, Email = @Email
WHERE CodigoDepartamento = @CodigoDepartamento;
IF @@ROWCOUNT = 0
BEGIN
INSERT ResponsavelDepartamento (CodigoDepartamento, Nome, Login, Email)
VALUES (@CodigoDepartamento, @Nome, @Login, @Email);
END;
COMMIT TRANSACTION;
GO;