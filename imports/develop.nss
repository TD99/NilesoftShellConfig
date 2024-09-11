menu(mode="single" title='&Develop' sep=sep.bottom image=\uE26E)
{
	// Editors
	menu(title='editors' mode="single" image=\uE17A)
	{
		item(title='Visual Studio Code' image=[\uE272, #22A7F2] cmd='code' args='"@sel.path"')
		item(title='Visual Studio' image=[\uE273, #7160E8] cmd='devenv' args='"@sel.path"')
		item(title='IntelliJ IDEA' image=[\uE271, #FFFFFF] cmd='idea' args='"@sel.path"')
		separator
		item(type='file' mode="single" title='Windows notepad' image cmd='@sys.bin\notepad.exe' args='"@sel.path"')
		item(type='file' mode="single" title='Notepad++' image cmd='C:\Program Files\Notepad++\notepad++.exe' args='"@sel.path"')
	}

	// Git
	menu(type='~file' mode="single" title='git' image=\uE22A)
	{
		item(title='git clone' cmd-line='cmd /c "C:\Program Files\Nilesoft Shell\scripts\git-clone.bat"')
		item(title='git status' cmd-line='/K git status')
		item(title='git log' cmd-line='/K git log')
		item(title='git diff' cmd-line='/K git diff')
		item(title='git add .' cmd-line='/K git add .')
		item(title='git commit' cmd-line='/K git commit')
		item(title='git push' cmd-line='/K git push')
		item(title='git pull' cmd-line='/K git pull')
		separator
		item(title='git config' cmd-line='/K git config --list')
		item(title='git help' cmd-line='/K git --help')
	}
	menu(type='file' mode="single" title='git' image=\uE22A)
	{
		item(title='git add "@sel.file.name"' type='file' cmd-line='/K git add "@sel.path"')
	}

	// Npm
	menu(type='~file' mode="single" title='npm' image=\uE229)
	{
		item(title='npm init' cmd-line='/K npm init')
		item(title='npm install' cmd-line='/K npm install')
		separator
		item(title='npm start' cmd-line='/K npm start')
		item(title='npm test' cmd-line='/K npm test')
		item(title='npm run build' cmd-line='/K npm run build')
		item(title='npm run dev' cmd-line='/K npm run dev')
	}

	// Docker
	menu(type='~file' mode="single" title='docker' image=\uE24B)
	{
		item(title='Docker Desktop' cmd='C:\Program Files\Docker\Docker\Docker Desktop.exe')
		item(title='Docker Hub' cmd='https://hub.docker.com/')
		separator
		item(title='docker container ls' cmd-line='/K docker container ls')
		item(title='docker image ls' cmd-line='/K docker image ls')
		item(title='docker volume ls' cmd-line='/K docker volume ls')
		item(title='docker network ls' cmd-line='/K docker network ls')
		separator
		item(title='docker-compose up' cmd-line='/K docker-compose up')
		item(title='docker-compose up -d' cmd-line='/K docker-compose up -d')
		item(title='docker-compose down' cmd-line='/K docker-compose down')
		item(title='docker-compose build' cmd-line='/K docker-compose build')
		separator
		item(title='docker system prune' cmd-line='/K docker system prune')
		item(title='docker image prune' cmd-line='/K docker image prune')
		item(title='docker volume prune' cmd-line='/K docker volume prune')
		item(title='docker network prune' cmd-line='/K docker network prune')
	}
	menu(type='file' mode="single" title='docker' image=\uE24B)
	{
		item(title='docker-compose -f "@sel.file.name" up' type='file' cmd-line='/K docker-compose -f "@sel.path" up')
		item(title='docker-compose -f "@sel.file.name" up -d' type='file' cmd-line='/K docker-compose -f "@sel.path" up -d')
		item(title='docker-compose -f "@sel.file.name" down' type='file' cmd-line='/K docker-compose -f "@sel.path" down')
	}

	// File system
	menu(type='file|dir|drive|namespace|back|desktop' mode="single" title='file system' image=\uE043)
	{
		item(type='file|dir|back.dir|drive|desktop' title='Take Ownership' image=[\uE194,#f00] admin
			cmd args='/K takeown /f "@sel.path" @if(sel.type==1,null,"/r /d y") && icacls "@sel.path" /grant *S-1-5-32-544:F @if(sel.type==1,"/c /l","/t /c /l /q")')
		menu(type='file|dir|back.dir|desktop' mode="single" title='Attributes')
		{
			$atrr = io.attributes(sel.path)
			item(title='Hidden' checked=io.attribute.hidden(atrr)
				cmd args='/c ATTRIB @if(io.attribute.hidden(atrr),"-","+")H "@sel.path"' window=hidden)
			
			item(title='System' checked=io.attribute.system(atrr)
				cmd args='/c ATTRIB @if(io.attribute.system(atrr),"-","+")S "@sel.path"' window=hidden)
				
			item(title='Read-Only' checked=io.attribute.readonly(atrr)
				cmd args='/c ATTRIB @if(io.attribute.readonly(atrr),"-","+")R "@sel.path"' window=hidden)
				
			item(title='Archive' checked=io.attribute.archive(atrr)
				cmd args='/c ATTRIB @if(io.attribute.archive(atrr),"-","+")A "@sel.path"' window=hidden)
			separator
			item(title="CREATED" keys=io.dt.created(sel.path, 'y/m/d') cmd=io.dt.created(sel.path,2000,1,1))
			item(title="MODIFIED" keys=io.dt.modified(sel.path, 'y/m/d') cmd=io.dt.modified(sel.path,2000,1,1))
			item(title="ACCESSED" keys=io.dt.accessed(sel.path, 'y/m/d') cmd=io.dt.accessed(sel.path,2000,1,1))
		}
		separator
		menu(separator="after" title=title.copy_path image=icon.copy_path)
		{
			item(mode="single" title=@sel.path tip=sel.path cmd=command.copy(sel.path))
			item(mode="single" type="~file" separator=before where=@sel.parent.len>3 title=sel.parent cmd=@command.copy(sel.parent))
			item(mode="single" type='file|dir|back.dir' separator=before title=sel.file.name cmd=command.copy(sel.file.name))
		}
	}
}