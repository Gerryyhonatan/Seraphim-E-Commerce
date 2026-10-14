CREATE TABLE refresh_tokens (
    refresh_token_id         SERIAL PRIMARY KEY,
    refresh_token_code       VARCHAR(100) NOT NULL UNIQUE,
    refresh_token_user_id    INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    refresh_token_expired_at TIMESTAMP NOT NULL,
    refresh_token_revoked_at TIMESTAMP NULL
);

CREATE INDEX idx_refresh_tokens_user_id ON refresh_tokens(refresh_token_user_id);