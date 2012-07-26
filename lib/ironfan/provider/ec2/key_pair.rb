module Ironfan
  class Provider
    class Ec2

      class KeyPair < Ironfan::Provider::Resource
        delegate :_dump, :collection, :collection=, :connection,
            :connection=, :destroy, :fingerprint, :fingerprint=, :identity,
            :identity=, :name, :name=, :new_record?, :private_key,
            :private_key=, :public_key, :public_key=, :reload, :requires,
            :requires_one, :save, :symbolize_keys, :wait_for, :writable?,
            :write,
          :to => :adaptee
      end

      class KeyPairs < Ironfan::Provider::ResourceCollection
        self.item_type =        KeyPair

        def load!(cluster)
          Ironfan::Provider::Ec2.connection.key_pairs.each do |kp|
            self << KeyPair.new(:adaptee => kp) unless kp.blank?
          end
        end

        #
        # Manipulation
        #

        #def create!(machines)             end

        #def destroy!(machines)            end

        #def save!(machines)               end
      end

    end
  end
end