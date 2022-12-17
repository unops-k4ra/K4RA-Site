# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Metrics/BlockLength
class Builders::LoadPages < SiteBuilder
  def build
    hook :site, :pre_render do
      index = site.data.dato.home

      add_resource :pages, "/index.erb" do
        title index.title
        dato_object index
        meta_type :page
        layout "default"
        content "<%= render Index.new(metadata: site.metadata, resource: resource) %>"
      end

      site.data.dato.pages.each do |page|
        add_resource :pages, "/#{page.slug}.erb" do
          title page.title
          dato_object page
          meta_type :page
          layout "top_nav"
          content "<%= render Page.new(resource: resource.data.dato_object) %>"
        end
      end

      site.data.dato.beneficiaries.each do |b|
        add_resource :pages, "/#{b.slug}.erb" do
          title b.title
          dato_object b
          meta_type :page
          layout "top_nav"
          content "*** slug: #{b.slug} ***"
        end
      end
    end
  end
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize, Metrics/BlockLength
