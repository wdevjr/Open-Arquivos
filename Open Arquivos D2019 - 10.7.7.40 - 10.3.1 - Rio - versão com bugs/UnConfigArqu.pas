// Programa: BiblioArqui
// v5.5.0.0
// Desenvolvedor: Walter R. H. Jr., RG:842956 - SSP/MS
// Todos os Direitos Reservados
// A Comercialização deste Software bem como do Font sem autorização do Autor é Terminantemente PROIBIDA !

unit UnConfigArqu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, Mask, DBCtrls, CheckLst, Grids,
  DBGrids, SimpleDS, DBClient;

type
  TFrmConfigArqu = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Image1: TImage;
    EditUserName: TEdit;
    ListBoxRecebe: TListBox;
    ssok: TSpeedButton;
    Dtsrc: TDataSource;
    PanelPrepara: TPanel;
    DBCheckBox1: TDBCheckBox;
    aplicar: TSpeedButton;
    DBEdit1: TDBEdit;
    DtsrcVisual: TDataSource;
    cancela: TSpeedButton;
    ok: TSpeedButton;
    EditUserCod: TEdit;
    SpeedButton1: TSpeedButton;
    // procedure sbAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBoxRecebeClick(Sender: TObject);
    procedure ListBoxRecebeDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure EditUserNameKeyPress(Sender: TObject; var Key: Char);
    procedure ssokClick(Sender: TObject);
    procedure aplicarClick(Sender: TObject);
    procedure cancelaClick(Sender: TObject);
    procedure okClick(Sender: TObject);
    procedure DtsrcVisualStateChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    // procedure SetButtons;
    // Procedure SetItem(List: TListBox; Index: Integer);
    // procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    // Function GetFirstSelection(List: TCustomListBox): Integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfigArqu: TFrmConfigArqu;

implementation

{$R *.dfm}

uses UProjeto, UDM, UnGridPesquiza, UDMII;

// procedure TFrmConfigArqu.SetItem(List: TListBox; Index: Integer);
// var
// MaxIndex: Integer;
// begin
// with List do
// begin
// SetFocus;
// MaxIndex := List.Items.Count - 1;
// if Index = LB_ERR then Index := 0
// else if Index > MaxIndex then Index := MaxIndex;
// Selected[Index] := True;
// end;
// SetButtons;
// end;

// procedure TFrmConfigArqu.SetButtons;
// var
// SrcEmpty, DstEmpty: Boolean;
// begin
// SrcEmpty := ListBoxRecebe.Items.Count = 0;
// DstEmpty := ListBoxAtributos.Items.Count = 0;
// if ListBoxAtributos.Items.Count = 0 then
// begin
// sbAdd.Enabled := not SrcEmpty;
// sbAddTodos.Enabled := not SrcEmpty;
// end;
// sbRemover.Enabled := not DstEmpty;
// sbRemoverTodos.Enabled := not DstEmpty;
// end;

// function TFrmConfigArqu.GetFirstSelection(List: TCustomListBox): Integer;
// begin
// for Result := 0 to List.Items.Count - 1 do
// if List.Selected[Result] then Exit;
// Result := LB_ERR;
// end;

// procedure TFrmConfigArqu.MoveSelected(List: TCustomListBox; Items: TStrings);
// var
// I: Integer;
// begin
// for I := List.Items.Count - 1 downto 0 do
// if List.Selected[I] then
// begin
// Items.AddObject(List.Items[I], List.Items.Objects[I]);
// List.Items.Delete(I);
// end;
// end;


// procedure TFrmConfigArqu.sbAddClick(Sender: TObject);
// var
// Index: Integer;
// begin
// Index := GetFirstSelection(ListBoxRecebe);
// MoveSelected(ListBoxRecebe, edtNome.Text);
// SetItem(ListBoxRecebe, Index);
// end;

// procedure TFrmConfigArqu.sbAddTodosClick(Sender: TObject);
// var
// I: Integer;
// begin
// for I := 0 to ListBoxRecebe.Items.Count - 1 do
// ListBoxAtributos.Items.AddObject(ListBoxRecebe.Items[I],
// ListBoxRecebe.Items.Objects[I]);
// ListBoxRecebe.Items.Clear;
// SetItem(ListBoxRecebe, 0);
//
// end;

// procedure TFrmConfigArqu.sbRemoverClick(Sender: TObject);
// var
// Index: Integer;
// begin
// Index := GetFirstSelection(ListBoxAtributos);
// MoveSelected(ListBoxAtributos, ListBoxRecebe.Items);
// SetItem(ListBoxAtributos, Index);
// DM.sdt_List.Close;
// end;

// procedure TFrmConfigArqu.sbRemoverTodosClick(Sender: TObject);
// var
// I: Integer;
// begin
// for I := 0 to ListBoxAtributos.Items.Count - 1 do
// ListBoxRecebe.Items.AddObject(ListBoxAtributos.Items[I], ListBoxAtributos.Items.Objects[I]);
// ListBoxAtributos.Items.Clear;
// SetItem(ListBoxAtributos, 0);
//
// end;

procedure TFrmConfigArqu.DtsrcVisualStateChange(Sender: TObject);
begin
  with DtsrcVisual.DataSet do
  begin
    cancela.Enabled := not IsEmpty;
  end;
end;

procedure TFrmConfigArqu.EditUserNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if EditUserName.Text <> '' then
    begin
      with DMII.DSBuscaUsuario.DataSet as TSimpleDataSet do
      Begin
        close;
        Params[0].AsString := '%' + EditUserName.Text + '%';
        Open;
        FrmGridAba := TFrmGridAba.Create(self);
        FrmGridAba.DBGrid1.DataSource := DMII.DSBuscaUsuario;
        if (FrmGridAba.showModal = mrOk) and
          (not DMII.DSBuscaUsuario.DataSet.IsEmpty) then
        begin
          TEdit(Sender).Text := DMII.DSBuscaUsuario.DataSet['NOME'];
          EditUserCod.Text := DMII.DSBuscaUsuario.DataSet.FieldByName
            ('COD_USUARIO').AsString;
        end;
      end;
    end;
  end;
end;

procedure TFrmConfigArqu.FormShow(Sender: TObject);
begin
  ListBoxRecebe.Items := DM.PreencheList;
end;

procedure TFrmConfigArqu.ListBoxRecebeClick(Sender: TObject);
begin
  EditUserCod.Clear;
  EditUserName.Clear;
  EditUserName.Text := ListBoxRecebe.Items[ListBoxRecebe.ItemIndex];
  PanelPrepara.Visible := False;
end;

procedure TFrmConfigArqu.ListBoxRecebeDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  begin
    if odSelected in State then
    begin
      ListBoxRecebe.Canvas.Brush.Color := clHighlight;
      ListBoxRecebe.Canvas.Font.Color := clHighlightText;
    end
    else
    begin
      ListBoxRecebe.Canvas.Font.Color := clBlack;
      if Odd(Index) then
        ListBoxRecebe.Canvas.Brush.Color := $00CBEAEB
      else
        ListBoxRecebe.Canvas.Brush.Color := $00FFF4F4;
    end;
    ListBoxRecebe.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2,
      ListBoxRecebe.Items[Index]);
  end;

end;

procedure TFrmConfigArqu.aplicarClick(Sender: TObject);
begin
  ListBoxRecebe.Enabled := True;
  ssok.Enabled := True;
  EditUserCod.Enabled := True;
  EditUserName.Enabled := True;
  aplicar.Enabled := False;
  ok.Enabled := True;
  if not DtsrcVisual.DataSet.Active then
    DtsrcVisual.DataSet.Open;
  DtsrcVisual.DataSet.Append;
end;

procedure TFrmConfigArqu.cancelaClick(Sender: TObject);
begin
  ListBoxRecebe.Enabled := False;
  ssok.Enabled := False;
  EditUserCod.Enabled := False;
  EditUserName.Enabled := False;
  PanelPrepara.Visible := False;
  ok.Enabled := False;
  aplicar.Enabled := True;
  DtsrcVisual.DataSet.Cancel;
end;

procedure TFrmConfigArqu.okClick(Sender: TObject);
begin
  DMII.cds_VisualCOD_USUARIO.Value := StrToInt(EditUserCod.Text);
  DtsrcVisual.DataSet.Post;
  (DtsrcVisual.DataSet as TClientDataSet).ApplyUpdates(0);
  // DM.cds_ArquivoCOD_VISUALIZADOR.Value:=DMII.cds_VisualID.AsInteger;
  ok.Enabled := False;
end;

procedure TFrmConfigArqu.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmConfigArqu.ssokClick(Sender: TObject);
begin
  PanelPrepara.Visible := True;
end;

END.
