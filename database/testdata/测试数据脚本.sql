declare @a INT = 1;

while @a<100000

begin
 insert into Books (Name,CreationTime) values('��' + CAST(@a AS VARCHAR),GETDATE())
 set @a=@a+1

end
SELECT TOP 10 * FROM Books;

