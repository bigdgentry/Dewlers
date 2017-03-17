<Forms FormName="Radiologist">
  <Style Theme="ui-humanity/jquery-ui-1.7.2.custom.css" LabelAlign="left" RoundCorners="True"    LabelWidth=""/>
  <Form Type="Add">
    <Data TableName="Radiologist" Key="RadId" SelectedFields="RadId,Name,Bio,Speciality,Pic" />
    <Controls>
      <TextBox Id="Name" Width="300" MaxLength="99" DataField="Name">
        <Label For="Name">Name</Label>
              <Validate Type="required" Text="Name" Message="Name Field is required!" />

      </TextBox>

      <HtmlInput Id="Bio" Height="300" Width="500" Nullable="true" DataField="Bio">
        <Label For="Bio">Bio</Label>
      </HtmlInput>

      <TextBox Id="Speciality" Width="500" Nullable="true" DataField="Speciality">
        <Label For="Speciality">Speciality</Label>
      </TextBox>

      <FileUpload Id="Pic" Nullable="true" DataField="Pic" DisplayMode="UploadAndSelect" Path="/images/bios/" Extensions="gif,jpg,png">
        <Label For="Pic">Pic</Label>
      </FileUpload>

      <ValidationSummary Id="vsRadiologist"/>


      <CommandButtons>
        <AddButton Text="Add" /> 
        <UpdateButton Text="Update" /> 
        <CancelButton Text="Cancel" style="margin-left: 12px;" Visible="true"/> 
      </CommandButtons>
    </Controls>
  </Form>
</Forms>