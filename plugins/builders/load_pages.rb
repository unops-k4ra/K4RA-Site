# frozen_string_literal: true

require "byebug"

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Metrics/BlockLength
class Builders::LoadPages < SiteBuilder
  def closed_opportunity?(opportunity)
    debugger
    return false if opportunity.closed_date.nil?

    opportunity.closed_date < Time.now
  end

  def build
    hook :site, :pre_render do
      index = site.data.dato.home

      add_resource :pages, "/index.erb" do
        title index.title
        dato_object index
        meta_type "page"
        layout "default"
        content "<%= render Index.new(metadata: site.metadata, resource: resource) %>"
      end

      site.data.dato.pages.each do |page|
        add_resource :pages, "/#{page.slug}.erb" do
          title page.title
          dato_object page
          meta_type "page"
          layout "top_nav"
          content "<%= render Page.new(resource: resource.data.dato_object, options: {}) %>"
        end
      end

      site.data.dato.beneficiaries.each do |b|
        add_resource :pages, "/#{b.slug}.erb" do
          title b.title
          dato_object b
          meta_type "beneficiary"
          layout "top_nav"
          content "*** slug: #{b.slug} ***"
        end
      end

      site.data.dato.updates.each do |update|
        add_resource :pages, "/#{update.slug}.erb" do
          title update.title
          meta_type "update"
          dato_object update
          layout "top_nav"
          content "*** I'm an update***"
        end
      end

      site.data.dato.events.each do |event|
        add_resource :pages, "/#{event.slug}.erb" do
          title event.title
          meta_type "event"
          dato_object event
          layout "top_nav"
          content "*** I'm an event***"
        end
      end

      site.data.dato.opportunities.each do |opportunity|
        add_resource :pages, "/#{opportunity.slug}.erb" do
          title opportunity.title
          meta_type opportunity.close_date < Time.now.utc ? "closed_opportunity" : opportunity.opportunity_type
          dato_object opportunity
          layout "top_nav"
          content "*** I'm an opportunity***"
        end
      end
    end
  end
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize, Metrics/BlockLength
