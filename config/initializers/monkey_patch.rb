#friendly_id\slugged.rb
FriendlyId::Slugged.module_eval do
    def resolve_friendly_id_conflict(candidate)
        [candidate, rand(36**3).to_s(36)].compact.join(friendly_id_config.sequence_separator)
    end

    # Sets the slug.
    def set_slug(normalized_slug = nil)
        if should_generate_new_friendly_id?
            candidates = FriendlyId::Candidates.new(self, normalized_slug || send(friendly_id_config.base))
            
            slug = slug_generator.generate(candidates)
            while slug.nil?
            slug = slug_generator.generate([resolve_friendly_id_conflict(candidates.first)])
            end

            send "#{friendly_id_config.slug_column}=", slug
        end
    end
end