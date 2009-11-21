#!/usr/bin/env ruby -w
# encoding: UTF-8
#
# = ReportContext.rb -- The TaskJuggler III Project Management Software
#
# Copyright (c) 2006, 2007, 2008, 2009 by Chris Schlaeger <cs@kde.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of version 2 of the GNU General Public License as
# published by the Free Software Foundation.
#

class TaskJuggler

  # Each Project has a single ReportContext object that is used during the
  # report generation. It is a container for global state.
  class ReportContext

    attr_reader :project, :report
    attr_accessor :query, :start, :end, :tasks, :resources

    def initialize(project, report)
      @project = project
      @report = report

      if (parent = @project.reportContext)
        # If the new ReportContext is created from within an existing context,
        # this is used as parent context and all attribute values are copied
        # as default initial values.
        instance_variables.each do |var|
          next if var.to_s == '@project' || var.to_s == '@report'

          instance_variable_set(var, parent.instance_variable_get(var))
        end
      else
        instance_variables.each do |var|
          next if var.to_s == '@project' || var.to_s == '@report'
          puts "var: #{var}"

          instance_variable_set(var, nil)
        end
      end
    end

  end
end
