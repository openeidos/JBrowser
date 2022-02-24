unit Sqlite3DB;

{$mode delphi}

interface

uses
  Classes, SysUtils, SQLite3Conn, SQLDB, DB, SQLite3DS, Forms, Controls,
  Graphics, LCLType, Dialogs, StdCtrls, DBGrids, MaskEdit, ExtCtrls, Menus,
  LCLProc, LazHelpHTML, fphttpclient, UTF8Process;

  procedure __connectDataBase(_SQLConnector: TSQLConnector;
                              _SQLTransaction: TSQLTransaction;
                              _SQLQuery: TSQLQuery;
                              _ConnectorType: String;
                              _DatabaseName: String;
                              _HostName: String);

  procedure __closeDataBase(_SQLConnector: TSQLConnector);

  procedure __connectSQLite3(_SQLite3Connection: TSQLite3Connection;
                             _SQLTransaction: TSQLTransaction;
                             _SQLQuery: TSQLQuery;
                             _DatabaseName: String;
                             _HostName: String);

  procedure __closeSQLite3(_SQLite3Connection: TSQLite3Connection);

  procedure __QueryDataBase(_SQLConnector: TSQLConnector;
                            _SQLTransaction: TSQLTransaction;
                            _SQLQuery: TSQLQuery;
                            _DataSource: TDataSource;
                            _ConnectorType: String;
                            _DatabaseName: String;
                            _SQL: String;
                            _DML: Boolean);

  procedure __QuerySQLite3(_SQLite3Connection: TSQLite3Connection;
                           _SQLTransaction: TSQLTransaction;
                           _SQLQuery: TSQLQuery;
                           _DataSource: TDataSource;
                           _DatabaseName: String;
                           _SQL: String;
                           _DML: Boolean);

  function  __Query(_SQL: String;
                    _SQLConnector: TSQLConnector;
                    _SQLTransaction: TSQLTransaction;
                    _SQLQuery: TSQLQuery;
                    _DatabaseName: String;
                    _DataSource: TDataSource;
                    _DML: Boolean): TSQLQuery;

  function  __QuerySQLite(_SQL: String;
                          _SQLite3Connection: TSQLite3Connection;
                          _SQLTransaction: TSQLTransaction;
                          _SQLQuery: TSQLQuery;
                          _DatabaseName: String;
                          _DataSource: TDataSource;
                          _DML: Boolean): TSQLQuery;

  procedure __Commit(_SQLTransaction: TSQLTransaction);
  procedure __Rollback(_SQLTransaction: TSQLTransaction);
  procedure __StartTransaction(_SQLTransaction: TSQLTransaction);
  procedure __EndTransaction(_SQLTransaction: TSQLTransaction);

const
  _ConnectorType = 'SQLite3';
  _DatabaseName = 'sqlite3db\SQLiteDataBase.db';   //Below Application.exe folder
  _HostName = '127.0.0.1';
  _Q_DML = True;
  _IDU_DML = False;

implementation

procedure __closeDataBase(_SQLConnector: TSQLConnector);
begin
     _SQLConnector.CloseDataSets;
end;

procedure __connectDataBase(_SQLConnector: TSQLConnector;
                            _SQLTransaction: TSQLTransaction;
                            _SQLQuery: TSQLQuery;
                            _ConnectorType: String;
                            _DatabaseName: String;
                            _HostName: String);
begin
     _DatabaseName := ExtractFilePath(Application.ExeName) + _DatabaseName;
     with _SQLConnector do begin
          ConnectorType := _ConnectorType;
          DatabaseName := _DatabaseName;
          HostName := _HostName;
     end;//end with

     with _SQLTransaction do begin
          DataBase := _SQLConnector;
     end;//end with

     with _SQLQuery do begin
          DataBase := _SQLConnector;
          Transaction := _SQLTransaction;
     end;//end with
end;

procedure __closeSQLite3(_SQLite3Connection: TSQLite3Connection);
begin
     _SQLite3Connection.CloseDataSets;
end;

procedure __connectSQLite3(_SQLite3Connection: TSQLite3Connection;
                           _SQLTransaction: TSQLTransaction;
                           _SQLQuery: TSQLQuery;
                           _DatabaseName: String;
                           _HostName: String);
begin
     _DatabaseName := ExtractFilePath(Application.ExeName) + _DatabaseName;
     with _SQLite3Connection do begin
          DatabaseName := _DatabaseName;
          HostName := _HostName;
          Transaction := _SQLTransaction;
     end;//end with

     with _SQLTransaction do begin
          DataBase := _SQLite3Connection;
     end;//end with

     with _SQLQuery do begin
          DataBase := _SQLite3Connection;
          Transaction := _SQLTransaction;
     end;//end with
end;

procedure __QueryDataBase(_SQLConnector: TSQLConnector;
                          _SQLTransaction: TSQLTransaction;
                          _SQLQuery: TSQLQuery;
                          _DataSource: TDataSource;
                          _ConnectorType: String;
                          _DatabaseName: String;
                          _SQL: String;
                          _DML: Boolean);
begin
     try
        _DatabaseName := ExtractFilePath(Application.ExeName) + _DatabaseName;
        _DataSource.DataSet := _SQLQuery;
        _SQLConnector.Connected := False;

        _SQLTransaction.StartTransaction;
        _SQLConnector.ConnectorType := _ConnectorType;
        _SQLConnector.DatabaseName := _DatabaseName;
//        _SQLQuery.Options := [sqoKeepOpenOnCommit, sqoAutoApplyUpdates, sqoAutoCommit];
        _SQLQuery.SQL.Clear;
        _SQLQuery.SQL.Text := _SQL;
        _SQLConnector.Open;

        if _DML = False then begin
           _SQLQuery.ExecSQL;
        end
        else _SQLQuery.Open;
     except
           _SQLTransaction.Rollback;
     end;//end try
end;

procedure __QuerySQLite3(_SQLite3Connection: TSQLite3Connection;
                         _SQLTransaction: TSQLTransaction;
                         _SQLQuery: TSQLQuery;
                         _DataSource: TDataSource;
                         _DatabaseName: String;
                         _SQL: String;
                         _DML: Boolean);
begin
     try
        _DatabaseName := ExtractFilePath(Application.ExeName) + _DatabaseName;
        _DataSource.DataSet := _SQLQuery;
        _SQLite3Connection.Connected := False;

        _SQLTransaction.StartTransaction;
        _SQLite3Connection.DatabaseName := _DatabaseName;
//        _SQLQuery.Options := [sqoKeepOpenOnCommit, sqoAutoApplyUpdates, sqoAutoCommit];
        _SQLQuery.SQL.Clear;
        _SQLQuery.SQL.Text := _SQL;
        _SQLite3Connection.Open;

        if _DML = False then begin
           _SQLQuery.ExecSQL;
        end
        else _SQLQuery.Open;
     except
           _SQLTransaction.Rollback;
     end;//end try
end;

function  __Query(_SQL: String;
                  _SQLConnector: TSQLConnector;
                  _SQLTransaction: TSQLTransaction;
                  _SQLQuery: TSQLQuery;
                  _DatabaseName: String;
                  _DataSource: TDataSource;
                  _DML: Boolean): TSQLQuery;
begin
     __connectDataBase(_SQLConnector, _SQLTransaction, _SQLQuery, _ConnectorType, _DatabaseName, _HostName);
     __QueryDataBase(_SQLConnector, _SQLTransaction, _SQLQuery, _DataSource, _ConnectorType, _DatabaseName, _SQL, _DML);
     result := _SQLQuery;
end;

function  __QuerySQLite(_SQL: String;
                        _SQLite3Connection: TSQLite3Connection;
                        _SQLTransaction: TSQLTransaction;
                        _SQLQuery: TSQLQuery;
                        _DatabaseName: String;
                        _DataSource: TDataSource;
                        _DML: Boolean): TSQLQuery;
begin
     __connectSQLite3(_SQLite3Connection, _SQLTransaction, _SQLQuery, _DatabaseName, _HostName);
     __QuerySQLite3(_SQLite3Connection, _SQLTransaction, _SQLQuery, _DataSource, _DatabaseName, _SQL, _DML);
     result := _SQLQuery;
end;

procedure __Commit(_SQLTransaction: TSQLTransaction);
begin
     _SQLTransaction.Commit;
end;
procedure __Rollback(_SQLTransaction: TSQLTransaction);
begin
     _SQLTransaction.Rollback;
end;

procedure __StartTransaction(_SQLTransaction: TSQLTransaction);
begin
     _SQLTransaction.StartTransaction;
end;

procedure __EndTransaction(_SQLTransaction: TSQLTransaction);
begin
     _SQLTransaction.EndTransaction;
end;


end.


