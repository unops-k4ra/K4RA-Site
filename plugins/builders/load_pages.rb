# frozen_string_literal: true

require "byebug"

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Metrics/BlockLength
class Builders::LoadPages < SiteBuilder
  def eu_acquis(page, site)
    add_resource :pages, "/#{page.slug}/clusters.erb" do
      title page.title
      dato_object page
      active_page "clusters"
      meta_type "eu-acquis"
      tab_component "clusters"
      layout "tabbed_page"
      content "<%= render Page.new(resource: resource.data.dato_object, options: {}) %>"
    end

    add_resource :pages, "/#{page.slug}/chapters.erb" do
      title page.title
      dato_object page
      active_page "chapters"
      meta_type "eu-acquis"
      tab_component "chapters"
      layout "tabbed_page"
      content "<%= render Page.new(resource: resource.data.dato_object, options: {}) %>"
    end

    site.data.dato.eu_acquis_chapters.each do |chapter|
      add_resource :pages, "/#{page.slug}/#{chapter.slug}.erb" do
        title chapter.title
        meta_type "chapter"
        dato_object chapter
        layout "top_nav"
        content "<%=
          render ChapterPage.new(resource: resource.data.dato_object, options: {})
          %>"
      end
    end
  end

  def updates(page, _site)
    add_resource :pages, "/#{page.slug}/all.erb" do
      title page.title
      dato_object page
      active_page "all"
      tab_component "all_tab"
      meta_type "updates"
      layout "tabbed_page"
      content "<%= render Page.new(resource: resource.data.dato_object, options: {}) %>"
    end

    add_resource :pages, "/#{page.slug}/news.erb" do
      title "News"
      color "#D64C62"
      dato_object page
      active_page "news"
      tab_component "tab"
      data_source "update"
      meta_type "updates"
      layout "tabbed_page"
      content "<%= render Page.new(resource: resource.data.dato_object, options: {}) %>"
    end

#    add_resource :pages, "/#{page.slug}/events.erb" do
#      title "Events"
#      color "#4DB3DF"
#      dato_object page
#      active_page "events"
#      tab_component "tab"
#      data_source "event"
#      meta_type "updates"
#      layout "tabbed_page"
#      content "<%= render Page.new(resource: resource.data.dato_object, options: {}) %>"
#    end

    site.data.dato.updates.each do |update|
      add_resource :pages, "/#{update.slug}.erb" do
        title update.title
        meta_type "update"
        dato_object update
        layout "top_nav"
        content "<%= render Update.new(
                                resource: resource.data.dato_object,
                                options: {})
                  %>"
      end
    end

#    site.data.dato.events.each do |event|
#      add_resource :pages, "/#{event.slug}.erb" do
#        title event.title
#        meta_type "event"
#        dato_object event
#        layout "top_nav"
#        content "<%= render Event.new(
#                                resource: resource.data.dato_object,
#                                options: {})
#                  %>"
#      end
#    end
  end

  def closed_opportunity?(opportunity)
    return false if opportunity.close_date.nil?

    opportunity.close_date < Time.now
  end

  def opportunity_meta_type(opportunity)
    if closed_opportunity?(opportunity)
      "closed_opportunity"
    else
      opportunity.opportunity_type
    end
  end

  def opportunities(page, site)
    add_resource :pages, "/#{page.slug}/all.erb" do
      title page.title
      dato_object page
      active_page "all"
      tab_component "all_tab"
      meta_type "opportunities"
      layout "tabbed_page"
      content "<%= render Page.new(resource: resource.data.dato_object, options: {}) %>"
    end

    add_resource :pages, "/#{page.slug}/tenders.erb" do
      title "Tenders"
      color "#D64C62"
      dato_object page
      active_page "tenders"
      tab_component "tab"
      data_source "tender"
      meta_type "opportunities"
      layout "tabbed_page"
      content "<%= render Page.new(resource: resource.data.dato_object, options: {}) %>"
    end

    add_resource :pages, "/#{page.slug}/careers.erb" do
      title "Careers"
      color "#4DB3DF"
      dato_object page
      active_page "careers"
      tab_component "tab"
      data_source "careers"
      meta_type "opportunities"
      layout "tabbed_page"
      content "<%= render Page.new(resource: resource.data.dato_object, options: {}) %>"
    end

    add_resource :pages, "/#{page.slug}/closed.erb" do
      title "Closed"
      color "#4DB3DF"
      dato_object page
      active_page "closed"
      tab_component "tab"
      data_source "closed_opportunity"
      meta_type "opportunities"
      layout "tabbed_page"
      content "<%= render Page.new(resource: resource.data.dato_object, options: {}) %>"
    end

    site.data.dato.opportunities.each do |opportunity|
      meta_type = opportunity_meta_type(opportunity)
      add_resource :pages, "/#{opportunity.slug}.erb" do
        title opportunity.title
        meta_type meta_type
        dato_object opportunity
        layout "top_nav"
        content "<%= render Opportunity.new(
          resource: resource.data.dato_object,
          options: {}) %>"
      end
    end
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
        case page.slug
        when "eu-acquis"
          eu_acquis(page, site)
        when "updates"
          updates(page, site)
        when "opportunities"
          opportunities(page, site)
        else
          add_resource :pages, "/#{page.slug}.erb" do
            title page.title
            dato_object page
            meta_type "page"
            layout "top_nav"
            content "<%= render Page.new(resource: resource.data.dato_object, options: {}) %>"
          end
        end
      end

      site.data.dato.beneficiaries.each do |b|
        add_resource :pages, "/beneficiaries/#{b.slug}.erb" do
          title b.title
          dato_object b
          meta_type "beneficiary"
          layout "top_nav"
          content "<%= render Beneficiary.new(
                                resource: resource.data.dato_object,
                                options: {page: resource.data.dato_object })
                  %>"
        end
      end

      site.data.dato.resources.each do |resource|
        add_resource :pages, "/resources/#{resource.slug}.erb" do
          title resource.title
          media_type "resource"
          dato_object resource
          layout "top_nav"
          content "<%= render Resource.new(
                                resource: resource.data.dato_object,
                                options: nil)
                  %>"
        end
      end
    end
  end
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize, Metrics/BlockLength
