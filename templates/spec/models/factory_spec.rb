# frozen_string_literal: true

require "rails_helper"

RSpec.describe "FactoryBot", type: :model do
  describe ".lint" do
    it "全てのFactoryが正常にcreateできる" do
      FactoryBot.lint(traits: true)
    end
  end
end
