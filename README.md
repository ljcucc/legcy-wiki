# Knowledge Base

## Requirements

to setup build tool:

```bash
brew install pandoc
```

to setup starter tool (`bin/start`), you need to install nodejs and setup npm:

> Make sure you setup npm prefix path correctly

```
npm install -g nodemon
```

> `nodemon` is an file event watcher to watch file changes, and auto run comamnds, `bin/start` use this tool to auto rebuild website once template or markdown changed.

`bin/start` also reqiured python3 to run (http-server module to host a localhost sevrer).

## Get started

Just run:

```bash
bin/build
```

For auto host an localhost server and hot-reload:

```bash
bin/start
```

file structure:

* `docs`: public html files
* `md`: markdown source files
* `src`: templates
* `bin`: build tool
