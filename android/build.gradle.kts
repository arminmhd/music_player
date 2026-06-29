buildscript {
    repositories {
        maven { url = uri("https://maven.myket.ir") }
    }
}

allprojects {
    repositories {
        maven { url = uri("https://maven.myket.ir") }
    }
}

// Customizing the build directory location
val newBuildDir = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    // Dynamically set subproject build directories inside the new build folder
    val newSubprojectBuildDir = newBuildDir.dir(project.name)
    project.layout.buildDirectory.set(newSubprojectBuildDir)
    
    // Fix circular dependency: Only apply evaluation dependency to projects that are NOT ':app'
    if (project.path != ":app") {
        project.evaluationDependsOn(":app")
    }
}

// Clean task configuration
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}