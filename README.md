# angular-multi-project-net

## Multi-project workspaces

More about multi-project can be found [here](https://www.tektutorialshub.com/angular/angular-multiple-apps-in-one-project/).

## Angular lazy-loading optimization

Not related to multi-project but something that can be used for [modules](https://www.freecodecamp.org/news/lazy-loading-in-angular-intro-to-ngmodules/#:~:text=In%20order%20to%20create%20lazy%20loaded%20modules%2C%20execute,contain%20its%20own%20module.ts%2C%20routing.ts%20and%20component%20files.)

## How to create a multi-project workspace

Install Angular CLI: `npm i -g @angular/cli`

Creating a multi-project workspace in Angular involves the following steps, leveraging the features provided by Angular CLI:

1. Workspace and application setup (in [file-structure.md](https://github.com/angular/angular/blob/6e29e853ed6973774acfe55c41da691d430bf54b/adev/src/content/reference/configs/file-structure.md#L96-L127)):

    * Create a new workspace with a unique name, while skipping initial application generation.

      `ng new my-workspace --no-create-application`

    * Change directory to your newly created workspace.
      
      `cd my-workspace`

    * Generate your applications and libraries. These should possess names which are unique within the workspace.

        ```bash
        ng generate application my-app
        ng generate library my-lib
        ```

1. Multi-project file structure (in [file-structure.md](https://github.com/angular/angular/blob/6e29e853ed6973774acfe55c41da691d430bf54b/adev/src/content/reference/configs/file-structure.md#L96-L127)):

    * The first explicitly generated application, and all other projects, reside within a projects folder in the workspace.
    * New libraries you generate are also added within projects.

## How to run

Build and run the docker file:

```bash
docker build . -t test-app

docker run -it --rm -p 8080:80 --name test-angular-app test-app
```

Test using:
* [http://localhost:8080](http://localhost:8080) for Angular
* [http://localhost:8080/weatherforecast](http://localhost:8080/weatherforecast) for API