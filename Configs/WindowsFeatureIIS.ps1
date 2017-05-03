Configuration  WindowsFeatureIIS
{ 

    Node localhost
    {
            WindowsFeature InstallWebServer 
		    { 
			    Ensure = "Present"
			    Name = "Web-Server" 
		    } 
    }
}

