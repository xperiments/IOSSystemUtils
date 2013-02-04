<extension xmlns="http://ns.adobe.com/air/extension/3.3">
	<id>es.xperiments.ane.iossystemutils.IOSSystemUtils</id>
	<versionNumber>@majorVersion@.@minorVersion@.@buildNumber@</versionNumber>
		<platforms> 
			<platform name="iPhone-ARM">
				<applicationDeployment>
					<nativeLibrary>libIOSSystemUtils.a</nativeLibrary>
					<initializer>IOSSystemUtilsExtensionInitializer</initializer>
					<finalizer>IOSSystemUtilsExtensionFinalizer</finalizer>
				</applicationDeployment>
			</platform>
			<platform name="iPhone-x86">
				<applicationDeployment>
					<nativeLibrary>libIOSSystemUtils.a</nativeLibrary>
					<initializer>IOSSystemUtilsExtensionInitializer</initializer>
					<finalizer>IOSSystemUtilsExtensionFinalizer</finalizer>
				</applicationDeployment>
			</platform>			
	</platforms>
</extension>
			