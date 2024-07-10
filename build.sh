#!/bin/bash

# Base stage (FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base)
# No equivalent shell commands needed for setting user, working directory, or exposing ports in this context

# Build stage (FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build)
set -x

# Define build configuration (default to Release if not specified)
BUILD_CONFIGURATION=${BUILD_CONFIGURATION:-Release}

# Set working directory
WORKDIR="/src"

# Copy the project file into the working directory
cp NET8.Demo.Service1.csproj .

# Restore dependencies
dotnet restore "./NET8.Demo.Service1.csproj"

# Copy all project files into the working directory
cp -r . "$WORKDIR"

# Change directory to the working directory
cd "$WORKDIR"

# Build the project
dotnet build "./NET8.Demo.Service1.csproj" -c $BUILD_CONFIGURATION -o /app/build

# Publish stage (FROM build AS publish)
# Define build configuration (default to Release if not specified)
# This effectively merges with the build stage in the shell script
dotnet publish "./NET8.Demo.Service1.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# Final stage (FROM base AS final)
# No equivalent shell commands needed for setting up the final stage

# Copy published files to final location
cp -r /app/publish/* /app/

# Set entrypoint
ENTRYPOINT="dotnet NET8.Demo.Service1.dll"
